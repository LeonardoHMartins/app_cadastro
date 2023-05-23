import 'package:app_cadastro/cubit/modal_cubit.dart';
import 'package:app_cadastro/modal/modal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_cadastro/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    BlocProvider(
      create: (context) => ModalCubit(),
      child: const MaterialApp(
        home: Modal(),
      ),
    ),
  );
}
