# Display Components

These components are used to present information to the user in a read-only format.

---

### `text`
Renders static or dynamic text without a label.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | String | `Text` | The text content. |
| `fontSize` | Double | - | Optional text size. |
| `fontWeight` | String | - | Optional weight, for example `bold` depending on renderer support. |
| `color` | String | - | Text color, usually a hex value. |
| `textAlign` | String | - | Text alignment. |
| `widthMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` | Double | - | Fixed width. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "title",
  "type": "text",
  "value": "Order #{{data.order_no}}",
  "fontSize": 20,
  "fontWeight": "bold",
  "color": "#111827"
}
```

---

### `field_display`
Renders a read-only labeled value.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | - | Label displayed above the value. |
| `value` | String | - | Text value to display. |
| `valueType` / `value_type` | String | - | Tipe data resolusi user/employee. Opsi: `"user_name"`, `"user_name_with_id"`, `"user_id"`. |
| `widthMode` | String | `hug` | `fill`, `hug`, or `fixed`. |
| `flex` | Integer | - | Flex factor. |

Example:

```json
{
  "id": "customer_name_display",
  "type": "field_display",
  "label": "Customer",
  "value": "{{data.customer.name}}",
  "widthMode": "fill"
}
```

Example with User Resolution:

```json
{
  "id": "created_by_display",
  "type": "field_display",
  "label": "Created By",
  "value": "{{data.created_by_id}}",
  "valueType": "user_name"
}
```

---

### `table`
Displays data in a grid.

**See the dedicated [ComponentTable Documentation](./component_table.md) for full details.**

---

### `list_view`
Renders a repeated component for every item returned from an API, local reference, or inline data.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `http` | Object | Empty GET config | HTTP config used to fetch list data. |
| `reference_id` | String | - | Optional local data source reference. |
| `initial_value` / `initialValue` / `data` | Any | - | Inline starting data. |
| `item` | Component | - | Component template rendered for each row/item. |
| `gap` | Double | `12.0` | Spacing between rendered items. |
| `emptyText` | String | `No data` | Text shown when there is no data. |
| `dependsOn` | Array<String> | `[]` | Component IDs that trigger reload. |
| `widthMode` / `heightMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` / `height` | Double | - | Fixed dimensions. |

Example:

```json
{
  "id": "recent_items",
  "type": "list_view",
  "http": {
    "method": "GET",
    "url": "/api/items?customer_id.eq={{form.customer_id}}",
    "headers": {},
    "body": {},
    "use_form_data": false
  },
  "dependsOn": ["customer_id"],
  "emptyText": "No items",
  "item": {
    "id": "item_name",
    "type": "field_display",
    "label": "Item",
    "value": "{{item.name}}"
  }
}
```

---

### `image`
Displays an image from a URL.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | String | `https://via.placeholder.com/150` | Image source. |
| `fit` | String | `cover` | Sizing strategy. |
| `width` / `height` | Double | - | Fixed dimensions. |
| `widthMode` / `heightMode` | String | - | `fill`, `hug`, or `fixed`. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "avatar",
  "type": "image",
  "url": "{{data.avatar_url}}",
  "width": 96,
  "height": 96,
  "fit": "cover"
}
```

---

## User Field Types

Tiga tipe field khusus untuk menampilkan data user/employee berdasarkan ID (nip/user_id).

Ketiga tipe ini menggunakan `EmployeeCache` — data di-fetch sekali dari endpoint `/users`
lalu disimpan di cache lokal. Pencarian menggunakan ID yang bisa bertipe `int` maupun `String`,
keduanya diperlakukan sama (mis. `1801005` dan `"1801005"` menghasilkan hasil yang sama).

### Perbandingan Tipe

| Type | Contoh Output | Keterangan |
| --- | --- | --- |
| `user_id` | `1801005` | Hanya NIP/ID — tidak perlu lookup ke cache |
| `user_name` | `Bimo Fikri Wicaksono` | Hanya nama — lookup ke cache |
| `user_name_with_id` | `1801005 - Bimo Fikri Wicaksono` | NIP + nama — lookup ke cache |

---

### `user_id`
Menampilkan nilai NIP/ID user **apa adanya** tanpa lookup nama. Cocok ketika hanya perlu
menampilkan kode identifikasi user.

**Contoh penggunaan di `fields`:**

```json
{
  "label": "NIP Inisiator",
  "reference": "created_by_id",
  "type": "user_id"
}
```

> Tidak membutuhkan jaringan/cache — langsung render nilai dari data.

---

### `user_name`
Menampilkan **nama user** berdasarkan ID-nya. Data diambil dari `EmployeeCache`.

**Contoh penggunaan di `fields`:**

```json
{
  "label": "Inisiator",
  "reference": "created_by_id",
  "type": "user_name"
}
```

> Jika user tidak ditemukan di cache, menampilkan tanda `-`.

---

### `user_name_with_id`
Menampilkan **NIP dan nama** sekaligus dalam format `"NIP - Nama"`.
Cocok untuk kolom tabel yang membutuhkan identifikasi sekaligus keterbacaan nama.

**Contoh penggunaan di `fields`:**

```json
{
  "label": "Inisiator",
  "reference": "created_by_id",
  "type": "user_name_with_id"
}
```

> Jika nama tidak ditemukan, hanya menampilkan ID-nya saja.

---

### `user_name` (sebagai Component)

Selain sebagai field type di `entity.json`, `user_name` juga tersedia sebagai **komponen nocode**
yang dapat digunakan di `layout_form` atau komponen lainnya.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `""` | Label opsional yang ditampilkan di atas nama. |
| `userId` | String | - | Ekspresi user ID. Mendukung interpolasi `{{data.created_by_id}}`. |
| `widthMode` | String | - | `fill`, `hug`, atau `fixed`. |
| `width` | Double | - | Lebar tetap. |
| `flex` | Integer | - | Flex factor. |

```json
{
  "id": "created_by_name",
  "type": "user_name",
  "label": "Dibuat Oleh",
  "userId": "{{data.created_by_id}}"
}
```

> Jika user tidak ditemukan atau `userId` kosong, komponen menampilkan tanda `-`.
