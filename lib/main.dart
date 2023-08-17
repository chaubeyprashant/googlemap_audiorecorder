import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nineheartz_assignment/providers/play_audio_provider.dart';
import 'package:nineheartz_assignment/providers/record_audio_provider.dart';
import 'package:nineheartz_assignment/record_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'google_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Permission.microphone.request();
  await Permission.storage.request();
  await Permission.manageExternalStorage.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecordAudioProvider()),
        ChangeNotifierProvider(create: (_) => PlayAudioProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginIn(),
      ),
    );;
  }
}
