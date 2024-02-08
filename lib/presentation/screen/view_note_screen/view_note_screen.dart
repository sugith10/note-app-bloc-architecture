import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_note/bloc/note_bloc.dart';
import 'package:new_note/model/note_model/note_model.dart';
import 'package:new_note/presentation/screen/add_or_edit_screen/add_or_edit_screen.dart';
import 'package:new_note/presentation/screen/home_screen/home_screen.dart';

class ViewNotePage extends StatelessWidget {
  final NoteModel note;
  const ViewNotePage({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            final noteBloc = BlocProvider.of<NoteBloc>(context);
            noteBloc.add(
              DeleteNote(id: note.id)
            );
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const HomeScreen()), (route) => false);
          }, icon: const Icon(Icons.delete_outline_rounded, color: Color.fromARGB(255, 255, 255, 255),))
        ],
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                note.title,
                style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                note.description,
                maxLines: 100,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton.extended(
   
        shape: const StadiumBorder(),
        onPressed: () {
         navigateToEditPage(context, note);
        },
        label: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  navigateToEditPage(BuildContext context, NoteModel note){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> AddToDoScrn(
      note: note,
    )));
  }
}
