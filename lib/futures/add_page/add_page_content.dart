import 'package:flutter/material.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dodaj nowe ćwiczenia'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Dodaj'))
          ],
        ),
      ),
    );
  }
}