import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  final void Function() goToHomePage;
  late final TapGestureRecognizer _tapGestureRecognizer;

  PageNotFoundScreen({Key? key, required this.goToHomePage}) : super(key: key) {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = goToHomePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieSearch"),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Page not found - Error 404,',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                  text: ' Return to Home Page',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: _tapGestureRecognizer),
            ],
          ),
        ),
      ),
    );
  }
}

/* ew */