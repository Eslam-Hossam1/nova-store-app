class ProductEntity {
  final String id;
  final String name;
  final List<String> images;
  final num price;
  final num discount;
  final num finalPrice;
  final int stock;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.discount,
    required this.finalPrice,
    required this.stock,
    required this.isFavorite,
  });
}
