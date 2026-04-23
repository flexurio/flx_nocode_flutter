/// Pagination configuration for an entity list view.
class PaginationOption {
  const PaginationOption({
    this.sortBy = 'created_at',
    this.ascending = false,
  });

  factory PaginationOption.fromJson(Map<String, dynamic> json) {
    return PaginationOption(
      sortBy: json['sort_by'] as String? ?? 'created_at',
      ascending: json['ascending'] as bool? ?? false,
    );
  }

  final String sortBy;
  final bool ascending;

  PaginationOption copyWith({
    String? sortBy,
    bool? ascending,
  }) {
    return PaginationOption(
      sortBy: sortBy ?? this.sortBy,
      ascending: ascending ?? this.ascending,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sort_by': sortBy,
      'ascending': ascending,
    };
  }
}
