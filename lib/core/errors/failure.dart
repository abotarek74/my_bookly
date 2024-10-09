import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessege;

  const Failure(this.errorMessege);
}

class ServerFaliure extends Failure {
  ServerFaliure(super.errorMessege);

  factory ServerFaliure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('Connection time out with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFaliure('Send time out with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Receive time out with apiServer');
      case DioExceptionType.badCertificate:
        return ServerFaliure('BadCretificte time out with apiServer');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFaliure('Request to apiServer was cancel');
      case DioExceptionType.connectionError:
        return ServerFaliure('ConnectionError time out with apiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure('No internet connection');
        }
        return ServerFaliure('Unexpected error, please try again');
      default:
        return ServerFaliure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFaliure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['error']['messege']);
    } else if (statusCode == 404) {
      return ServerFaliure('Not Found , try again later');
    } else if (statusCode == 500) {
      return ServerFaliure('Server Error , try again later');
    } else {
      return ServerFaliure('opps , there was an error , try again later');
    }
  }
}
