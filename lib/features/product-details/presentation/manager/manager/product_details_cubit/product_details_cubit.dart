import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_details_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_details_param.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/get_product_details_usecase.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final String productId;
  late ProductDetailsEntity productDetailsEntity;

  ProductDetailsCubit({
    required GetProductDetailsUseCase getProductDetailsUseCase,
    required this.productId,
  })  : _getProductDetailsUseCase = getProductDetailsUseCase,
        super(const ProductDetailsInitial());

  Future<void> getProductDetails() async {
    emit(const ProductDetailsLoading());
    final result = await _getProductDetailsUseCase(
      GetProductDetailsParam(productId: productId),
    );
    result.fold(
      (failure) => emit(ProductDetailsFailure(errorMessage: failure.errMsg)),
      (productDetails) {
        productDetailsEntity = productDetails;
        emit(const ProductDetailsSuccess());
      },
    );
  }
}
