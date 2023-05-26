import 'package:flutter/material.dart';

class PronunciationChecker extends StatefulWidget {
  const PronunciationChecker({super.key});

  @override
  State<PronunciationChecker> createState() => _PronunciationCheckerState();
}

class _PronunciationCheckerState extends State<PronunciationChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Pronunciation Page'),
      ),
    );
  }
}
