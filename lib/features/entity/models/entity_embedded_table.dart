/// Configuration for embedding a secondary entity table inside an entity view
/// (e.g. inside an [EntityCardGridView] modal dialog).
class EntityEmbeddedTable {
  final String entityId;
  final String? title;

  const EntityEmbeddedTable({
    required this.entityId,
    this.title,
  });

  factory EntityEmbeddedTable.fromRaw(dynamic raw) {
    if (raw == null) {
      return const EntityEmbeddedTable(entityId: '');
    }
    if (raw is String) {
      return EntityEmbeddedTable(entityId: raw);
    }
    if (raw is Map) {
      final id = (raw['entity'] ??
              raw['target_entity'] ??
              raw['entity_id'] ??
              raw['id'] ??
              '')
          .toString();
      final title = raw['title']?.toString() ?? raw['label']?.toString();
      return EntityEmbeddedTable(
        entityId: id,
        title: title,
      );
    }
    return const EntityEmbeddedTable(entityId: '');
  }
}
