import 'package:flutter/material.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  // int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
    );
  }
}
