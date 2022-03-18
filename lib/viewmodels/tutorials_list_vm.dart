import 'package:cohora_introscreen/services/tutorials_services.dart';
import 'package:cohora_introscreen/viewmodels/tutorials_vm.dart';
import 'package:flutter/material.dart';

class TutorialsListVM extends ChangeNotifier {
  List<TutorialsViewModel> tutorials = <TutorialsViewModel>[];

  Future<void> fetchTutorials() async {
    final results = await TutorialsAPI().fetchtutorials();
    tutorials = results!.map((e) => TutorialsViewModel(tutorials: e)).toList();
    notifyListeners();
  }
}
