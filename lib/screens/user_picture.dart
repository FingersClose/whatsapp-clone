import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class UserPicture extends StatelessWidget {
  VoidCallback? onPressed;
  double? squareSize;
   UserPicture({
    super.key,
    this.onPressed,
    this.squareSize
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: squareSize ?? 45,
      width: squareSize ?? 45,
      child: InkWell(
        onTap: onPressed,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SvgPicture.asset(
              "assets/images/profile_default_dp.svg",
              height: 40,
            ),
            ),
      ),
    );
  }
}
