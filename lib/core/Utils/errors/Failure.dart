import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        if (dioException.response != null) {
          return ServerFailure.fromResponse(
            dioException.response!.statusCode,
            dioException.response!.data,
          );
        } else {
          return ServerFailure('Unexpected error, response is null');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops, there was an Error. Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response?['error']?['message'] ?? 'Authentication error');
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found. Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error. Please try later');
    } else {
      return ServerFailure('Oops, there was an Error. Please try again');
    }
  }
}
