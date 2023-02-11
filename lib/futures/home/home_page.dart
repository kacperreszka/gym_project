import 'package:flutter/material.dart';

import 'achevements/achevements_page_content.dart';
import 'add_page/add_page_content.dart';
import '../auth/pages/user_profile.dart';
import 'training/traning_page_content.dart';

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
      appBar: AppBar(
        title: const Text('Gym Project'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const TrainingPageContent();
        }
        if (currentIndex == 1) {
          return const AddPageContent();
        }
        return const AchievementsPageContent();
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Trening',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Nowe Ćwiczenia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Osiągnięcia',
          ),
        ],
      ),
    );
  }
}
