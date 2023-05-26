import 'package:flutter/material.dart';

class GrammarChecker extends StatefulWidget {
  const GrammarChecker({super.key});

  @override
  State<GrammarChecker> createState() => _GrammarCheckerState();
}

class _GrammarCheckerState extends State<GrammarChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Grammar Page'),
      ),
    );
  }
}
