import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:misfits/controller/joinNotifier.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/screenSize.dart';
import 'package:misfits/utils/widget/clubInfoRow.dart';
import 'package:misfits/utils/widget/clubNavBar.dart';
import 'package:misfits/utils/widget/divider.dart';
import 'package:misfits/screens/joinedClub.dart';

import 'package:misfits/utils/widget/pfpCircle.dart';
import 'package:provider/provider.dart';

/*Main Page*/
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinNotifier>(builder: (context, _joinNotifier, child) {
      return Scaffold(
        backgroundColor: appColors.background,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              MaterialIcons.arrow_back_ios,
              color: appColors.white,
              size: 16.dg,
            ),
            onPressed: () {
              _joinNotifier.joinNow = !_joinNotifier.joined;
            },
          ),
          title: Text(
            'Hiking and Outdoors Club',
            style: roboto(appColors.white, 20.sp, FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(MaterialCommunityIcons.message_alert_outline,
                  size: 24.dg, color: appColors.white),
              onPressed: () {
                // can add functionality here
              },
            ),
          ],
        ),
        body: SizedBox(
          width: double.maxFinite.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: SafeArea(
                  child: ListView(
                    children: [
                      clubInfo(),
                      const divider(),
                      Gap(_joinNotifier.joined ? 0 : 40.h),
                      _joinNotifier.joined
                          ? joinedClub(joined: _joinNotifier.joined)
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
              // Frosted Clubnavbar Start
            
              AnimatedPositioned(
                duration: Durations.long1,
                bottom: _joinNotifier.joined ? 30 : -110,
                child: const ClubNavBar(),
              ),
              // Frosted Clubnavbar End
              //Join Button Start
              AnimatedPositioned(
                bottom: _joinNotifier.joined ? -110.h : 0,
                curve: Curves.easeInOut,
                duration: Durations.long1,
                child: AnimatedContainer(
                  curve: Easing.emphasizedAccelerate,
                  alignment: Alignment.center,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: appColors.grey)),
                      color: appColors.black),
                  duration: Durations.extralong2,
                  child: SafeArea(
                    left: false,
                    right: false,
                    top: false,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                      child: GestureDetector(
                        onTap: () {
                          _joinNotifier.joinNow = !_joinNotifier.joined;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth(context),
                          height: 45.h,
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                              color: appColors.buttonColor,
                              borderRadius: BorderRadius.circular(25.r)),
                          child: Text(
                            "Join Now",
                            style:
                                roboto(appColors.white, 20.sp, FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //// join Button End
            ],
          ),
        ),
      );
    });
  }
}
