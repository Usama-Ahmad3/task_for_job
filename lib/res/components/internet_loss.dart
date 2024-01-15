import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InternetLoss extends StatelessWidget {
  const InternetLoss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/connection.json',
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7),
          ),
          Text(
            'No internet connection available',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
