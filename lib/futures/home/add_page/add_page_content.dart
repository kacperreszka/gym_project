import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  var newTask = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dodaj swoje kolejne ćwiczenie',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.add_circle),
                  hintText: 'Wpisz nowe ćwiczenie',
                  hintStyle: TextStyle(color: Colors.red),
                ),
                autofocus: true,
                onChanged: (newValue) {
                  setState(() {
                    newTask = newValue;
                  });
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('categories').add(
                  {'name': 'Siema'},
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
