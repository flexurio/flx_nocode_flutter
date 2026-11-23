# Electronic Signature (E-Signature) Documentation

Fitur **Built-in E-Signature** menyediakan dialog konfirmasi tanda tangan elektronik untuk kebutuhan kepatuhan regulatori/farmasi (**CPOB / 21 CFR Part 11 / GMP**) tanpa perlu merakit input kata sandi dan request verifikasi secara manual di setiap tombol.

---

## 1. Alur Kerja (Execution Flow)

1. Pengguna menekan tombol aksi (`ActionD`) atau tombol **Submit** pada `layout_form` (`SubmitWorkflow`) yang memiliki konfigurasi `signature`.
2. Jika aksi memiliki validasi form (`validate: true` atau form submit), validasi form dijalankan terlebih dahulu.
3. Muncul modal **Tanda Tangan Elektronik** yang menampilkan:
   - Nama dan NIP pengguna yang sedang login (dari session JWT aktif).
   - Pilihan **Makna Tanda Tangan (*Signature Meaning*)** (misal: *"Disetujui"*, *"Ditinjau"*, *"Ditolak"*).
   - Input **Kata Sandi Konfirmasi** (*obscure* dengan toggle visibility).
4. Saat pengguna menekan **Tanda Tangani & Lanjutkan**, frontend mengirim `POST` ke endpoint verifikasi:
   - `verify_url` jika dikonfigurasi (mendukung interpolasi `{{backend_host}}`), atau
   - `POST {{backend_host}}/auth/verify-password` secara default.
   - Tidak ada fallback atau token dummy; jika verifikasi gagal atau server tidak mengembalikan `signature_token`, dialog menampilkan pesan error dan eksekusi dihentikan.
5. Jika verifikasi berhasil:
   - Token dan metadata tanda tangan diinjeksi ke scope interpolasi (`{{ signature.token }}`, `{{ signature.meaning }}`, `{{ signature.signer_name }}`, `{{ signature.signer_nip }}`).
   - Header `X-Signature-Token` otomatis disisipkan ke seluruh HTTP request pada aksi maupun workflow terkait.
   - Aksi / workflow dilanjutkan.

---

## 2. Konfigurasi `signature`

| Key | Type | Default | Deskripsi |
|---|---|---|---|
| `meanings` | `Array<String \| Object>` | `["Disetujui"]` | Daftar pilihan makna tanda tangan. Mendukung string biasa atau objek `{"label": "Disetujui", "value": "APPROVED"}`. |
| `default_meaning` | `String` | `null` | Makna yang terpilih otomatis saat dialog dibuka. |
| `verify_url` | `String` | `null` | Endpoint kustom verifikasi kata sandi (mendukung `{{backend_host}}`). Default: `POST {{backend_host}}/auth/verify-password`. |
| `title` | `String` | `"Tanda Tangan Elektronik"` | Judul dialog. |
| `require_meaning` | `Boolean` | `true` | Wajib memilih makna tanda tangan. |
| `require_password` | `Boolean` | `true` | Wajib memasukkan kata sandi konfirmasi. |

---

## 3. Variabel Konteks (Template Interpolation)

Setelah verifikasi berhasil, variabel berikut tersedia di body/URL/header request maupun langkah `submit_workflow`:

- `{{ signature.token }}` — Token tanda tangan elektronik dari server.
- `{{ signature.meaning }}` — Makna tanda tangan yang dipilih pengguna.
- `{{ signature.signer_name }}` — Nama pengguna penanda tangan.
- `{{ signature.signer_nip }}` — NIP / role identifier penanda tangan.
- `{{ signature.signed_at }}` — Timestamp ISO-8601 saat ditandatangani.

---

## 4. Contoh Penggunaan (Best Practice)

### A. Aksi Persetujuan Langsung (`actions` / `actions_home`)
Gunakan `"type": "http"` atau `"type": "workflow"` untuk persetujuan langsung 1 klik:

```json
{
  "id": "setujui_cpob",
  "name": "Evaluasi & Setujui",
  "type": "http",
  "signature": {
    "title": "Konfirmasi Tanda Tangan Persetujuan CPOB",
    "meanings": [
      { "label": "Disetujui", "value": "APPROVED" },
      { "label": "Ditinjau", "value": "REVIEWED" },
      { "label": "Ditolak", "value": "REJECTED" }
    ],
    "default_meaning": "APPROVED",
    "verify_url": "{{backend_host}}/auth/verify-password"
  },
  "http": {
    "method": "POST",
    "url": "{{backend_host}}/api/evaluations/{{row.id}}/approve",
    "body": {
      "meaning": "{{signature.meaning}}",
      "signature_token": "{{signature.token}}"
    }
  },
  "on_success": ["refresh", "toast"]
}
```

### B. Persetujuan dengan Form Evaluasi (`submit_workflow` di `layout_form`)
Untuk aksi yang membuka form (`open_page` / `show_dialog`), letakkan `signature` di dalam `submit_workflow` agar dialog muncul **setelah** form diisi dan divalidasi:

```json
{
  "submit_label": "Simpan & Setujui",
  "submit_workflow": {
    "type": "workflow",
    "signature": {
      "title": "Tanda Tangan Elektronik",
      "meanings": ["Disetujui", "Disetujui dengan Catatan"],
      "default_meaning": "Disetujui",
      "verify_url": "{{backend_host}}/auth/verify-password"
    },
    "actions": [
      {
        "type": "http",
        "http": {
          "method": "POST",
          "url": "{{backend_host}}/api/evaluations/{{data.id}}/approve",
          "body": {
            "notes": "{{form.notes}}",
            "meaning": "{{signature.meaning}}"
          }
        }
      },
      { "type": "toast", "message": "Evaluasi berhasil disetujui" },
      { "type": "close_modal" }
    ]
  }
}
```
