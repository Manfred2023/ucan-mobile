 import 'package:flutter/material.dart';

/// Error
class ErrorPage extends StatelessWidget {
  /// error
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Error',
          ),
        ),
      ),
    );
  }
}
