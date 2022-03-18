import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgPostIcons(String path) {
  return SizedBox(
    height: 30,
    width: 50,
    child: SvgPicture.asset(
      path,
    ),
  );
}
