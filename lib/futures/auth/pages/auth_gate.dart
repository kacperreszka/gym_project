import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:gym_project/futures/HomePage/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          // If the user is already signed-in, use it as initial data
          initialData: FirebaseAuth.instance.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SignInScreen(providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: ''),
              ]);
            }

            // Render your application if authenticated
            return const HomePage();
          },
        );
      },
    );
  }
}