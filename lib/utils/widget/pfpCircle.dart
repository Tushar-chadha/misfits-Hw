import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfits/utils/colors.dart';

class pfpCircle extends StatelessWidget {
  const pfpCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 127.h,
          height: 127.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [appColors.lightPurple, appColors.darkPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 124.h,
          height: 124.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: appColors.background,
          ),
        ),
        Container(
          width: 120.h,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: Transform.scale(
              scale: 1.7.r,
              origin: Offset(0, 14.h),
              child: Image.asset(
                "assets/images/personalTimeLog.png",
                isAntiAlias: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
