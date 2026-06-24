import 'package:flx_nocode_flutter/features/component/models/component.dart'
    show Component;
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

/// Komponen untuk menampilkan nama user/employee berdasarkan ID-nya.
///
/// Komponen ini secara otomatis mengambil data nama dari cache employee
/// menggunakan [userId] sebagai kunci pencarian.
///
/// ### Component Type
/// - `user_name`
///
/// ### Properties
/// - **id**: Identifier unik komponen.
/// - **label**: Label yang ditampilkan di atas nilai (opsional, default kosong).
/// - **userId**: Ekspresi atau nilai user id (nip). Mendukung interpolasi
///   `{{data.created_by_id}}`. Dapat berupa String atau int.
///
/// ### Contoh JSON
/// ```json
/// {
///   "id": "created_by_name",
///   "type": "user_name",
///   "label": "Dibuat Oleh",
///   "userId": "{{data.created_by_id}}"
/// }
/// ```
///
/// ### Catatan
/// - Jika user tidak ditemukan, menampilkan `-`.
/// - Cache di-invalidate saat logout.
class ComponentUserName extends Component {
  /// Label yang ditampilkan di atas nama (opsional).
  final String label;

  /// Ekspresi user id — mendukung interpolasi `{{data.field}}`.
  /// Bisa berupa int atau String dari response API.
  final String userId;

  final ComponentSizeMode? widthMode;
  final double? width;
  final int? flex;

  ComponentUserName({
    required super.id,
    required this.userId,
    this.label = '',
    this.widthMode,
    this.width,
    this.flex,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'user_name');

  static String get componentId => 'user_name';

  factory ComponentUserName.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final userId = map['userId']?.toString().trim() ?? '';

    return ComponentUserName(
      id: id,
      label: map['label']?.toString().trim() ?? '',
      userId: userId,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  factory ComponentUserName.empty(String id) {
    return ComponentUserName(
      id: id,
      label: 'User',
      userId: '{{data.created_by_id}}',
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'label': label,
        'userId': userId,
        'widthMode': widthMode?.name,
        'width': width,
        'flex': flex,
      };
}
