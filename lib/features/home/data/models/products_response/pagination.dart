class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalProducts;
  bool? hasNext;
  bool? hasPrev;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalProducts,
    this.hasNext,
    this.hasPrev,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['currentPage'] as int?,
        totalPages: json['totalPages'] as int?,
        totalProducts: json['totalProducts'] as int?,
        hasNext: json['hasNext'] as bool?,
        hasPrev: json['hasPrev'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'totalPages': totalPages,
        'totalProducts': totalProducts,
        'hasNext': hasNext,
        'hasPrev': hasPrev,
      };
}
