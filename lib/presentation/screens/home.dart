import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_app/cubit/app_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference notesref = FirebaseFirestore.instance.collection('notes');

  FirebaseAuth userref = FirebaseAuth.instance;
  String? id;

  @override
  void initState() {
    id = userref.currentUser?.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async{
              await BlocProvider.of<AppCubit>(context).signOut();  
            }, 
            icon: icon)
        ]),
    );
  }
}
