import 'package:cohora_introscreen/models/tutorials.dart';

class TutorialsViewModel {
  final Tutorials tutorials;

  TutorialsViewModel({required this.tutorials});

  String get name {
    return tutorials.buttonName.toString();
  }

  String get buttonIconUrl {
    return tutorials.buttonIconUrl.toString();
  }
  String get videoUrl {
    return tutorials.videoUrl.toString();
  }
}
