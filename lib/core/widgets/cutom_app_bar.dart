import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilis/styles.dart';

AppBar buildAppBar({final String? title,required BuildContext context}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
        ),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
