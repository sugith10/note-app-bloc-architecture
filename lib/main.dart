import 'package:flutter/material.dart';
import 'package:new_note/bloc/note_bloc.dart';
import 'package:new_note/data/data%20provider/note_data_provider.dart';
import 'package:new_note/data/repository/note_repository.dart';
import 'package:new_note/presentation/screen/splash_screen/splash_screen.dart';
import 'package:new_note/presentation/theme/vintage_teme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NoteRepository(NoteDataProvider()),
      child: BlocProvider(
        create: ((context) => NoteBloc(
              context.read<NoteRepository>(),
            )),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: vintageTheme,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
