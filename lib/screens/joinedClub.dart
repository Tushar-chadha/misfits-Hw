import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/constantData.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/screenSize.dart';
import 'package:misfits/utils/widget/clubGroupWidget.dart';
import 'package:misfits/utils/widget/clubMemberWidget.dart';
import 'package:misfits/utils/widget/divider.dart';

/*After the join Club Button is pressed this widget and its child widgets will be shown*/
class joinedClub extends StatefulWidget {
  final bool joined;

  const joinedClub({super.key, required this.joined});

  @override
  State<joinedClub> createState() => _joinedClubState();
}

class _joinedClubState extends State<joinedClub> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.joined ? 120.h : 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: roboto(appColors.white,
                screenWidth(context) > 400 ? 20.sp : 18.sp, FontWeight.w600),
          ),
          Gap(10.h),
          Text(
              textAlign: TextAlign.justify,
              style: roboto(appColors.white,
                  screenWidth(context) > 400 ? 17.sp : 14.sp, FontWeight.w400),
              "A community of vibrant people who share a passion for boardgames! Find a plethora of games waiting to be explored! Seasoned players and complete newbies, all are welcome! The rules will be explained and repeated as many times as required!."),
          Gap(5.h),
          const divider(),
          Text(
            "Managed By",
            style: roboto(appColors.white,
                screenWidth(context) > 400 ? 20.sp : 18.sp, FontWeight.w600),
          ),
          Gap(5.h),
          SizedBox(
            height: 120.h,
            width: screenWidth(context),
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  clubMembersData.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            index % 2 == 0
                                ? "assets/images/male.png"
                                : "assets/images/female.png",
                          ),
                          backgroundColor: appColors.floatingBarIconColor,
                          radius: screenWidth(context) > 400 ? 32.r : 28.r,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            clubMembersData[index]["name"],
                            style: roboto(
                                appColors.white,
                                screenWidth(context) > 400 ? 18.sp : 16.sp,
                                FontWeight.w700),
                          ),
                        ),
                        Text(
                          "Admin",
                          style: roboto(
                              appColors.white,
                              screenWidth(context) > 400 ? 16.sp : 14.sp,
                              FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          const divider(),
          GestureDetector(
            onTap: () {
              setState(() {
                clubMembers = !clubMembers;
              });
            },
            child: Row(
              children: [
                Text(
                  "Club Members",
                  style: roboto(
                      appColors.white,
                      screenWidth(context) > 400 ? 20.sp : 18.sp,
                      FontWeight.w600),
                ),
                Icon(
                  clubMembers
                      ? MaterialIcons.arrow_drop_down
                      : MaterialIcons.arrow_right,
                  color: appColors.white,
                  size: 26.w,
                )
              ],
            ),
          ),
          Gap(5.h),
          clubMembers
              ? AnimatedContainer(
                  duration: Durations.long1,
                  curve: Curves.easeIn,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: Column(
                    children: List.generate(
                        groupNames.length,
                        (index) => clubGroupWidget(
                              name: groupNames[index],
                            )),
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: SizedBox(
              width: screenWidth(context),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: List.generate(
                        clubMembersData.length,
                        (index) => clubMemberWidget(
                              img: index % 2 == 0
                                  ? "assets/images/male.png"
                                  : "assets/images/female.png",
                              name: clubMembersData[index]["name"],
                              clubCouncil: clubMembersData[index]
                                  ["clubCouncil"],
                              og: clubMembersData[index]["og"],
                            )),
                  ),
                  Gap(10.h),
                  Text(
                    "View All(55 Members)",
                    style: roboto(
                        appColors.textPurple,
                        screenWidth(context) > 400 ? 18.sp : 16.sp,
                        FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const divider(),
          // end
        ],
      ),
    );
  }
}
