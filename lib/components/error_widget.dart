import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String error;
  const ErrorWidget(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Icon(
          Icons.error_outline_rounded,
          color: Colors.white.withOpacity(0.5),
          size: 50,
        ),
        SizedBox(height: 5),
        Text(
          error,
          // 'Search returned no results!',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
