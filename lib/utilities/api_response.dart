import 'package:flutter_provider_state_management/utilities/response_status.dart';

class ApiResponse<T> {
  AppStatus? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = AppStatus.LOADING;
  ApiResponse.completed() : status = AppStatus.COMPLETED;
  ApiResponse.error() : status = AppStatus.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}
