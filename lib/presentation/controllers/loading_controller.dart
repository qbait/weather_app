import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Status { uninitialized, loading, success, error }

class LoadingController extends GetxController {
  final status = Status.uninitialized.obs;

  final _errorMessage = ''.obs;

  bool get isUninitialized => status() == Status.uninitialized;

  bool get isSuccess => status() == Status.success;

  bool get isLoading => status() == Status.loading;

  bool get isError => status() == Status.error;

  String get errorMessage => _errorMessage();

  ValueChanged<String>? onError;

  VoidCallback? onSuccess;

  void uninitialized() {
    status.value = Status.uninitialized;
  }

  void success() {
    status.value = Status.success;
    onSuccess?.call();
  }

  void loading() {
    status.value = Status.loading;
  }

  void error(String error) {
    status.value = Status.error;
    _errorMessage.value = error;
    onError?.call(error);
  }
}
