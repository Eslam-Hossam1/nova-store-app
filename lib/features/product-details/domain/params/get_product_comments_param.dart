/// Params wrapping the product ID for [GetProductCommentsUseCase].
///
/// Following the project rule: use cases never accept raw primitive values.
class GetProductCommentsParam {
  final String productId;

  const GetProductCommentsParam({required this.productId});
}
