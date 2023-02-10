import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_app/cubit/app_cubit.dart';
import 'package:node_app/presentation/widgets.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({super.key, required this.note, required this.docId});
  final note;
  final docId;

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  late String title;
  late String note;

  @override
  void initState() {
    title = widget.note['title'];
    note = widget.note['note'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    editNote() async {
      showLoadingIndicator(context, 'Adding Note...');
      BlocProvider.of<AppCubit>(context).editANote(
          title: title,
          note: note,
          docID: widget.docId,
          uId:
              BlocProvider.of<AppCubit>(context).firebaseAuth.currentUser!.uid);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Home();
      }));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: widget.note['title'],
                    onChanged: (value) {
                      title = value;
                    },
                    decoration:
                        MytextFieldDecoration.copyWith(hintText: 'Note title'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: widget.note['note'],
                    onChanged: (value) {
                      note = value;
                    },
                    decoration: MytextFieldDecoration.copyWith(hintText: ''),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MaterialButtonWidget(
                      color: Colors.deepOrangeAccent,
                      text: 'Save',
                      function: () {
                        editNote();
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
