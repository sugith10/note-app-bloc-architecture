import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_note/bloc/note_bloc.dart';
import 'package:new_note/presentation/screen/add_or_edit_screen/add_or_edit_screen.dart';
import 'package:new_note/presentation/screen/home_screen/widget/note_listview_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteBloc>().add(GetNote());
  }

  @override
  Widget build(BuildContext context) {
    log('on build function');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('My Notes'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoteBloc>().add(GetNote());
            },
            icon: const Icon(Icons.replay_rounded),
          )
        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
        if (state is NoteFail) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is! NoteSuccess) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        }

        final noteList = state.noteModels;
        return NoteList(noteList: noteList);
      }),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        onPressed: () {
          navigateToAddPage();
        },
        label: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> navigateToAddPage() async {
    await Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child:  AddToDoScrn(),
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400)),
    );
  }
}
