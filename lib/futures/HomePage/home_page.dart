import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const TrainingPageContent();
        }
        if (currentIndex == 1) {
          return const AchievementsPageContent();
        }
        return MyAccountPageContent();
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: 'Trening'),
          BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'Osiągnięcia'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Konto'),
        ],
      ),
    );
  }
}

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Jesteś zalogowany jako '),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Wyloguj'))
        ],
      ),
    );
  }
}

class AchievementsPageContent extends StatelessWidget {
  const AchievementsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          Text('Siema'),
        ],
      ),
    );
  }
}

class TrainingPageContent extends StatelessWidget {
  const TrainingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Coś poszło nie tak');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Trwa ładowanie danych z bazy');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Text(document['name']),
              ],
            ],
          );
        });
  }
}
