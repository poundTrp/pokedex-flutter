import 'package:pokedex_flutter/constants/statusCode.dart';

class ApiResponse<T> {
  late Status status;
  late T data;
  late String message;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
