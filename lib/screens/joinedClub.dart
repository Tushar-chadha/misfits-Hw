import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:misfits/utils/colors.dart';
import 'package:misfits/utils/fontStyle.dart';
import 'package:misfits/utils/screenSize.dart';
import 'package:misfits/utils/widget/divider.dart';

class joinedClub extends StatefulWidget {
  final bool joined;

  joinedClub({super.key, required this.joined});

  @override
  State<joinedClub> createState() => _joinedClubState();
}

class _joinedClubState extends State<joinedClub> {
  List groupNames = [
    "Fictional Readers",
    "Quest Hunters",
    "Dragon Quest Follower"
  ];
  bool clubMembers = false;
  List<Map<String, dynamic>> clubMembersData = [
    {"name": "Naval", "og": false, "clubCouncil": true},
    {"name": "Sanchita", "og": true, "clubCouncil": false},
    {"name": "Ahem", "og": false, "clubCouncil": false},
    {"name": "Gopi", "og": false, "clubCouncil": true},
    {"name": "Jigar", "og": true, "clubCouncil": true},
  ];

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
                        (index) => clubGroups(
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

class clubGroups extends StatelessWidget {
  const clubGroups({
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
