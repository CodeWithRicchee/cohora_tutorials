import 'package:cohora_introscreen/const/const.dart';
import 'package:cohora_introscreen/models/intro_model.dart';
import 'package:cohora_introscreen/screens/videoplayer_screen.dart';
import 'package:cohora_introscreen/utils/svgicon.dart';
import 'package:cohora_introscreen/viewmodels/tutorials_vm.dart';
import 'package:flutter/material.dart';

class IntroButtons extends StatelessWidget {
  const IntroButtons({Key? key, required this.tutorials}) : super(key: key);
  final List<TutorialsViewModel> tutorials;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height - 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 230,
            mainAxisExtent: 77,
            childAspectRatio: 3 / 2,
            // crossAxisSpacing: 10,
            mainAxisSpacing: 20),
        itemCount: buttons.length,
        itemBuilder: (BuildContext context, index) {
          final tutorial = buttons[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                          url: tutorial.videoURL.toString(),
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   width: 24,
                  //   height: 24,
                  //   child: Image.network(tutorial.buttonIconUrl.toString()),
                  // ),
                  svgPostIcons(tutorial.icon.toString()),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      tutorial.name,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: buttonBackground,
                  boxShadow: shadows,
                  borderRadius: BorderRadius.circular(15)),
            ),
          );
        },
      ),
    );
  }
}
