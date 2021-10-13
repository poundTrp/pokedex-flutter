import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';

class LoadingError extends StatelessWidget {
  final String errorMessage;
  final Function() onRetryPressed;

  LoadingError({required this.errorMessage, required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFontSize.subheading,
              color: AppColor.errorColor,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: onRetryPressed,
            style: ElevatedButton.styleFrom(
              primary: AppColor.errorButtonColor,
            ),
            child: Text(AppDefaultValue.retryMessage),
          ),
        ],
      ),
    );
  }
}
