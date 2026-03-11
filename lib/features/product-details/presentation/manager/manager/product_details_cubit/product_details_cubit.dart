import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
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

  void prependComment(ProductCommentEntity newComment) {
    productDetailsEntity = ProductDetailsEntity(
      id: productDetailsEntity.id,
      userId: productDetailsEntity.userId,
      name: productDetailsEntity.name,
      details: productDetailsEntity.details,
      images: productDetailsEntity.images,
      price: productDetailsEntity.price,
      finalPrice: productDetailsEntity.finalPrice,
      discount: productDetailsEntity.discount,
      categoryId: productDetailsEntity.categoryId,
      stock: productDetailsEntity.stock,
      rateProduct: productDetailsEntity.rateProduct,
      comments: <ProductCommentEntity>[
        newComment,
        ...productDetailsEntity.comments,
      ],
      isFavorite: productDetailsEntity.isFavorite,
    );
    emit(const ProductDetailsCommentAdded());
    emit(const ProductDetailsSuccess());
  }
}
