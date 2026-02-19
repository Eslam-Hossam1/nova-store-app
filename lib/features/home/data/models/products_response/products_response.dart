import 'data.dart';

class ProductsResponse {
  String? status;
  String? message;
  Data data;

  ProductsResponse({this.status, this.message, required this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}
