import 'package:flutter/material.dart';

/**
 * Usage:
 * ```dart
 *  CustomSnackbar(
 *    message: "Created a new message successfully",
 *    color: Colors.green,
 *    duration: Duration(milliseconds: 200),
 *  ).build(context);
 * ```
 */
class CustomSnackbar extends StatelessWidget {
  final String message;
  final BuildContext context;
  final Color color;
  final Duration duration;

  const CustomSnackbar({
    Key key,
    this.message,
    this.context,
    this.color = Colors.black,
    this.duration = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: duration,
      ),
    );

    return null;
  }
}
