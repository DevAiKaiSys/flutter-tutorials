import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:data_layer/data_layer.dart';
import 'package:flutter/material.dart';

import 'presentation_layer/auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* // fix error SharedPreferences
  SharedPreferences.getInstance(); */

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
