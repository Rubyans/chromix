import 'dart:async';
import 'package:dio/dio.dart';

/// API exception
class ApiException implements Exception {
  /// Status code
  final int? statusCode;

  /// Error message
  final String message;

  /// Response data
  final dynamic data;

  /// Constructor model
  ApiException({required this.message, this.statusCode, this.data});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// HTTP requests
class Requests {
  /// Dio client
  final Dio _dio;

  /// Constructor model
  Requests({
    String baseUrl = "",
    Map<String, String>? headers,
  }) : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl.endsWith('/') ? baseUrl : '$baseUrl/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        ...?headers,
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      validateStatus: (c) => c != null && c >= 200 && c < 300,
    ),
  );

  /// GET request
  Future<Map<String, dynamic>> get(
      String path, {
        Map<String, Object?>? query,
        Map<String, String>? headers,
      }) async {
    try {
      final r = await _dio.get<Object?>(
        path,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _asMap(r.data);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, Object?>? query,
    Map<String, String>? headers,
    bool multipart = false,
  }) async {
    try {
      final r = await _dio.post<Object?>(
        path,
        data: multipart
            ? data != null
            ? FormData.fromMap(data)
            : null
            : data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _asMap(r.data);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// PUT request
  Future<Map<String, dynamic>> put({
    required String url,
    Map<String, dynamic>? data,
    Map<String, Object?>? query,
    Map<String, String>? headers,
  }) async {
    try {
      final r = await _dio.put<Object?>(
        url,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _asMap(r.data);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// PATCH request
  Future<Map<String, dynamic>> patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, Object?>? query,
    Map<String, String>? headers,
  }) async {
    try {
      final r = await _dio.patch<Object?>(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _asMap(r.data);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// DELETE request
  Future<Map<String, dynamic>> delete(
      String path, {
        Map<String, Object?>? query,
        Map<String, Object?>? data,
        Map<String, String>? headers,
      }) async {
    try {
      final r = await _dio.delete<Object?>(
        path,
        queryParameters: query,
        options: Options(headers: headers),
        data: data,
      );
      return _asMap(r.data);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// Convert response to map
  Map<String, dynamic> _asMap(Object? data) {
    if (data == null) return <String, dynamic>{};
    if (data is Map) return Map<String, dynamic>.from(data);
    return <String, dynamic>{'data': data};
  }

  /// Convert Dio error
  ApiException _toApiException(DioException e) {
    final code = e.response?.statusCode;
    final data = e.response?.data;
    final msg = _msg(e);
    return ApiException(statusCode: code, message: msg, data: data);
  }

  /// Extract message
  String _msg(DioException e) {
    final d = e.response?.data;
    if (d is Map) {
      for (final k in ['message', 'error', 'detail', 'title']) {
        final v = d[k];
        if (v is String && v.trim().isNotEmpty) return v.trim();
      }
      final errs = d['errors'];
      if (errs is Map && errs.isNotEmpty) {
        final first = errs.values.first;
        if (first is List && first.isNotEmpty && first.first is String) {
          return (first.first as String).trim();
        }
      }
    }
    if (d is String && d.trim().isNotEmpty) return d.trim();
    return e.message ?? 'Request error';
  }
}
