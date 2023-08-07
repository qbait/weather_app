import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/loading_controller.dart';

class LoadingView extends StatelessWidget {
  final LoadingController controller;
  final Widget? uninitializedView;
  final Widget contentView;
  final Widget? progressView;
  final Widget? errorView;
  final ValueChanged<String>? onError;
  final VoidCallback? onSuccess;

  const LoadingView(
    this.controller,
    this.contentView, {super.key,
    this.progressView,
    this.errorView,
    this.onError,
    this.onSuccess,
    this.uninitializedView,
  });

  @override
  Widget build(BuildContext context) {
    controller.onError = onError;
    controller.onSuccess = onSuccess;

    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    if (controller.isSuccess) {
      return _contentView();
    } else if (controller.isLoading) {
      return _progressView();
    } else if (controller.isError) {
      final message = controller.errorMessage;
      return _errorView(message);
    } else {
      return _uninitializedView();
    }
  }

  Widget _uninitializedView() => uninitializedView ?? _contentView();

  Widget _contentView() => contentView;

  Widget _progressView() => progressView ?? const Center(child: CircularProgressIndicator());

  Widget _errorView(String message) => errorView ?? _contentView();
}
