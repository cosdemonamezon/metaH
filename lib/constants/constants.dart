import 'package:flutter/material.dart';

String pathApi = "https://project-h.dev-asha.com";

String BASE_URL = 'project-h.dev-asha.com';

bool isPhone(BuildContext context) => MediaQuery.of(context).size.shortestSide < 550;

Container kHugeHSpaceing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return Container(height: isPhone ? 36 : 46, width: isPhone ? 58 : 68,);
}
