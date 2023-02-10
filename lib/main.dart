import 'package:flutter/material.dart';
import 'package:email/theme/routes.dart';
import 'package:email/views/opening_screen.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
runApp( MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formation',
      routes: AppRoutes.define(),
      home: const OpeningView(),
    );}
}




