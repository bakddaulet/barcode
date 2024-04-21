import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String errorMessage) {
  final snackbar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
