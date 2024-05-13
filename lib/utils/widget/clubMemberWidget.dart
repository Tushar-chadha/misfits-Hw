
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/screenSize.dart';

class clubMemberWidget extends StatelessWidget {
  final bool og, clubCouncil;
  final String name, img;
  const clubMemberWidget(
      {super.key,
      this.og = false,
      this.clubCouncil = false,
      required this.name,
      required this.img});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(img),
                backgroundColor: Colors.white,
                radius: screenWidth(context) > 400 ? 32.r : 28.r,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 15.w),
                child: Row(
                  children: [
                    Text(
                      name,
                      style: roboto(
                          appColors.white,
                          screenWidth(context) > 400 ? 19.sp : 17.sp,
                          FontWeight.w600),
                    ),
                    og
                        ? Container(
                            margin: EdgeInsets.only(left: 5.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(246, 159, 58, 1),
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Text(
                              "OG",
                              style: roboto(
                                  appColors.blackButLighter,
                                  screenWidth(context) > 400 ? 8.sp : 8.sp,
                                  FontWeight.w700),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
          clubCouncil
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: appColors.lightGrey)),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Text(
                    "Club Council",
                    style: roboto(
                        appColors.lightGrey,
                        screenWidth(context) > 400 ? 16.sp : 14.sp,
                        FontWeight.w400),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
