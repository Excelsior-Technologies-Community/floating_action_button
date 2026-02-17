import 'package:flutter/material.dart';
import 'package:floating_action_button/floating_action_button.dart';

void main() {
  runApp(const FabDemoApp());
}

class FabDemoApp extends StatelessWidget {
  const FabDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FAB Library Example",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating Action Button"),
        centerTitle: true,
      ),

      /// SIMPLE BODY
      body: const Center(
        child: Text(
          "Press the + button\n\nExpandable FAB will open",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),

      /// YOUR LIBRARY WIDGET
      floatingActionButton: FloatingActionExpandableFab(
        style: const FabStyle(
          backgroundColor: Colors.teal,
          showLabels: false,
        ),
        items: [
          FabItem(
            icon: Icons.camera_alt,
            onTap: () {
              debugPrint("Camera clicked");
            },
          ),
          FabItem(
            icon: Icons.photo,
            onTap: () {
              debugPrint("Gallery clicked");
            },
          ),
          FabItem(
            icon: Icons.message,
            onTap: () {
              debugPrint("Message clicked");
            },
          ),
        ],
      ),
    );
  }
}
