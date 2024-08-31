import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/src/Constant/Color.dart';
import 'package:lottie/lottie.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  @override
  CustomError({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/errorMessage.json',
              repeat: true, height: 100),
          Text(
            kDebugMode
                ? errorDetails.summary.toString()
                : 'Oops! Something went wrong!',
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Lato'),
          )
        ],
      ),
    );
  }
}
