/// Params wrapping the product ID for [GetProductDetailsUseCase].
///
/// Following the project rule: use cases never accept raw primitive values.
class GetProductDetailsParam {
  final String productId;

  const GetProductDetailsParam({required this.productId});
}
