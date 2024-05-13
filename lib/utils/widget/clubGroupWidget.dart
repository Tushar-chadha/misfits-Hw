
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/screenSize.dart';

class clubGroupWidget extends StatelessWidget {
  const clubGroupWidget({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      width: screenWidth(context),
      decoration: BoxDecoration(
          color: appColors.blackButLighter,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: appColors.lightGrey, width: 0.2.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/group.png"),
            radius: 22.r,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              name,
              style: roboto(appColors.white,
                  screenWidth(context) > 400 ? 20.sp : 18.sp, FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
