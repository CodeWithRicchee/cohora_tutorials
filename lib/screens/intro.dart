import 'package:cohora_introscreen/const/const.dart';
import 'package:cohora_introscreen/viewmodels/tutorials_list_vm.dart';
import 'package:cohora_introscreen/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Provider.of<TutorialsListVM>(context, listen: false).fetchTutorials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tutorialsVM = Provider.of<TutorialsListVM>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          color: greenAccent,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  height: 100,
                  child: Text(
                    "Tutorials",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      shadows: textshadows,
                    ),
                  )),
              Container(
                color: greenAccent,
                child:  IntroButtons(tutorials: tutorialsVM.tutorials),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
