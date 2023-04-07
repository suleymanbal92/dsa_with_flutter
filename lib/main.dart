import 'package:flutter/material.dart';

import 'sorts/selection_sort.dart';

void main() {
  runApp(const DsaWithFlutter());
}

class DsaWithFlutter extends StatelessWidget {
  const DsaWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSA with Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectionSort(),
    );
  }
}
