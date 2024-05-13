import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfits/utils/colors.dart';
import 'package:misfits/utils/screenSize.dart';

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      color: appColors.lightGrey,
      height: 0.5.h,
      width: screenWidth(context),
    );
  }
}
