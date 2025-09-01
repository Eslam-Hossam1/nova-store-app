class ApiErrorModel {
  bool success;
  String message;
  String error;

  ApiErrorModel({
    required this.success,
    required this.message,
    required this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        success: json['success'] as bool,
        message: json['message'] as String,
        error: json['error'] as String,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'error': error,
      };

  ApiErrorModel copyWith({
    bool? success,
    String? message,
    String? error,
  }) {
    return ApiErrorModel(
      success: success ?? this.success,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}
