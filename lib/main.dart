import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_app/data/note_repository.dart';
import 'package:node_app/presentation/screens/home.dart';

import 'cubit/app_cubit.dart';
import 'presentation/screens/notes/add_notes.dart';
import 'presentation/screens/sign_in.dart';
import 'presentation/screens/sign_up.dart';

bool isSignedIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDebOriwp_FcSHDY8Ul7oJoAxivjzdW8uQ",
          appId: "1:242453460225:android:fb4f7387a19693fe169700",
          messagingSenderId: "242453460225",
          projectId: "note-app-3ea3b"));
  print("Intialized");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(
          repository: NoteRepository(
              firestore: FirebaseFirestore.instance.collection('notes')),
          firebaseAuth: firebaseAuth),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const Home(),
          'signin': (context) => SignIn(),
          'signup': (context) => SignUp(),
          'add': (context) => const AddNotes(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const Home();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.active) {
              return SignIn();
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
