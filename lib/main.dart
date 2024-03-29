import 'package:cohora_introscreen/screens/intro.dart';
import 'package:cohora_introscreen/viewmodels/tutorials_list_vm.dart';
import 'package:cohora_introscreen/viewmodels/tutorials_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<TutorialsListVM>(
                create: (BuildContext context) {
              return TutorialsListVM();
            }),
          ],
          child: const IntroScreen(),
        ));
  }
}
