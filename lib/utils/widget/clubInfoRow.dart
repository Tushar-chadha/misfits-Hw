import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/screenSize.dart';
import 'package:misfits/utils/widget/divider.dart';
import 'package:misfits/utils/widget/pfpCircle.dart';

class clubInfo extends StatelessWidget {
  clubInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //start of top row pfp->total Members->Active Members
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const pfpCircle(),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.04.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "98",
                          style: roboto(
                              appColors.white,
                              screenWidth(context) > 428 ? 28.sp : 24.sp,
                              FontWeight.w500),
                        ),
                        Text(
                          "Total Members",
                          style: roboto(
                              appColors.white,
                              screenWidth(context) > 428 ? 14.sp : 12.sp,
                              FontWeight.w600),
                        ),
                      ],
                    ),
                    Gap(30.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "32",
                              style: roboto(
                                  appColors.white,
                                  screenWidth(context) > 428 ? 28.sp : 24.sp,
                                  FontWeight.w500),
                            ),
                            Gap(5.w),
                            Icon(
                              MaterialIcons.info_outline,
                              color: Colors.white,
                              size: 22.w,
                            )
                          ],
                        ),
                        Text(
                          "Active Members",
                          style: roboto(
                              appColors.white,
                              screenWidth(context) > 428 ? 14.sp : 12.sp,
                              FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //End of top row pfp->total Members->Active Members
          Gap(15.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: appColors.lightGrey, width: 1.2.w)),
                    child: Row(
                      children: [
                        Icon(
                          MaterialCommunityIcons.hiking,
                          color: appColors.lightGrey,
                          size: 18.w,
                        ),
                        Text(
                          "Hiking",
                          style: roboto(
                              appColors.lightGrey, 14.sp, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(5.h),
              Text(
                "Hiking and Outdoors Club",
                style: roboto(appColors.white, 26.sp, FontWeight.w500),
              ),
              Gap(10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We usually meet at",
                    style: roboto(appColors.white, 18.sp, FontWeight.w800),
                  ),
                  Gap(10.h),
                  const TimePlaceInfo(
                    loactionImg: "assets/images/location1.png",
                    monday: true,
                    wednesday: true,
                    friday: true,
                  ),
                  const TimePlaceInfo(
                    loactionImg: "assets/images/location2.png",
                    monday: true,
                    wednesday: true,
                    friday: true,
                  ),
                ],
              ),
              divider(),
              Text(
                "FAQs",
                style: roboto(appColors.white, 16.sp, FontWeight.w600),
              ),
              Column(
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                        color: appColors.blackButLighter,
                        borderRadius: BorderRadius.circular(10.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Can i bring a friend?",
                          style:
                              roboto(appColors.white, 16.sp, FontWeight.w500),
                        ),
                        const Icon(
                          MaterialIcons.arrow_drop_down,
                          color: appColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimePlaceInfo extends StatelessWidget {
  final bool monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  final String loactionImg;

  const TimePlaceInfo({
    Key? key,
    this.monday = false,
    this.tuesday = false,
    this.wednesday = false,
    this.thursday = false,
    this.friday = false,
    this.saturday = false,
    this.sunday = false,
    required this.loactionImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: 80.h,
      width: screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 0.5.w, color: appColors.lightGrey)),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 15.w),
              height: 32.h,
              width: 32.w,
              child: Icon(
                size: 32.dg,
                Octicons.location,
                color: appColors.white,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: screenHeight(context) < 750 ? 70.h : 60.h,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Sanjay Van",
                    softWrap: true,
                    style: roboto(
                        appColors.white,
                        screenWidth(context) >= 400 ? 18.sp : 16.sp,
                        FontWeight.w500),
                  ),
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            buildDayText("M", monday, context),
                            buildDayText("T", tuesday, context),
                            buildDayText("W", wednesday, context),
                            buildDayText("T", thursday, context),
                            buildDayText("F", friday, context),
                            buildDayText("S", saturday, context),
                            buildDayText("S", sunday, context),
                          ],
                        ),
                        Text(
                          "7:00 PM - 9:30 PM",
                          style: roboto(
                              appColors.textPurple,
                              screenWidth(context) >= 410 ? 16.sp : 13.sp,
                              FontWeight.bold),
                        ),
                      ])
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: double.maxFinite,
              width: 90.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      isAntiAlias: true,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: AssetImage(loactionImg)),
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10.r))),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDayText(String day, bool isSelected, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      child: Text(
        day,
        style: roboto(
          isSelected ? appColors.textPurple : appColors.lightGrey,
          screenWidth(context) > 400 ? 16.sp : 13.sp,
          FontWeight.bold,
        ),
      ),
    );
  }
}
