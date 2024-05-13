import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:misfits/utils/constant/colors.dart';
import 'package:misfits/utils/constant/fontStyle.dart';
import 'package:misfits/utils/constant/screenSize.dart';

class ClubNavBar extends StatefulWidget {
  const ClubNavBar({
    Key? key,
  }) : super(key: key);

  @override
  _ClubNavBarState createState() => _ClubNavBarState();
}

class _ClubNavBarState extends State<ClubNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.85,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: const Color(0xB13B383C),
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
             BoxShadow(
            color: appColors.black.withOpacity(.7),
            spreadRadius: 30.r,
            blurRadius: 30.r,
            offset:  Offset(0.w, 60.h), 
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3), 
            
          ),
          
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                notifications: 0,
                icon: MaterialIcons.groups,
                text: 'Meet-Ups',
                index: 0,
              ),
              _buildNavItem(
                notifications: 3,
                icon: MaterialCommunityIcons.message_text_outline,
                text: 'Groups',
                index: 1,
              ),
              _buildNavItem(
                notifications: 0,
                icon: MaterialIcons.info_outline,
                text: 'Info',
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String text,
    required int index,
    required int notifications,
  }) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        width: 60.w,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              curve: Curves.easeIn,
              duration: Durations.medium1,
              padding: EdgeInsets.symmetric(
                  horizontal: _selectedIndex != index ? 0.w : 16.w,
                  vertical: 4.h),
              decoration: BoxDecoration(
                  color: _selectedIndex != index
                      ? Colors.transparent
                      : appColors.textPurple.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    icon,
                    color: _selectedIndex == index
                        ? appColors.white
                        : appColors.lightGrey,
                    size: screenWidth(context) > 400 ? 28.w : 26.w,
                  ),
                  if (notifications > 0)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 16.w,
                        height: 16.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appColors.peach.withOpacity(1)),
                        child: Text(
                          notifications.toString(),
                          style: TextStyle(
                            color: appColors.blackButLighter,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Gap(2.h),
            Text(
              text,
              style: roboto(
                _selectedIndex == index ? Colors.white : appColors.lightGrey,
                screenWidth(context) > 400 ? 16.sp : 12.sp,
                FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
