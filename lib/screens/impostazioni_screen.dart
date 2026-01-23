import 'package:flutter/material.dart';

/// A placeholder screen for settings (impostazioni).
/// This screen can be expanded with actual settings options as needed.
class ImpostazioniScreen extends StatelessWidget {
  const ImpostazioniScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Impostazioni')));
  }
}
