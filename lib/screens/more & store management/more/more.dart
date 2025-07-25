import 'package:burger_home/constants/constants.dart';
import 'package:burger_home/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:burger_home/screens/ad-details/widgets/custom-title.dart';
import 'package:burger_home/screens/more%20&%20store%20management/more/widgets/info-row.dart';
import 'package:burger_home/screens/more%20&%20store%20management/more/widgets/options-container.dart';
import 'package:burger_home/screens/more%20&%20store%20management/more/widgets/small-container.dart';
import 'package:burger_home/screens/more%20&%20store%20management/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../edit-item/widgets/draggable-button.dart';
import 'provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoreScreenProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: 'More'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  height: 80.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoRow(
                          image: SvgPicture.asset(
                            person,
                            height: 48.h,
                            width: 48.w,
                          ),
                          name: 'Mohammed Salem',
                          number: '+91231515548',
                        ),
                        GestureDetector(
                          child: SmallContainer(
                            color: containerColor,
                            title: 'Details',
                          ),
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                ProfileScreen.id,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTitle(title: 'Store Management'),
                SizedBox(height: 16.h),

                OptionsContainer(items: provider.storeManagementItems(context)),
                SizedBox(height: 16.h),

                CustomTitle(title: 'Marketing Ads'),
                SizedBox(height: 16.h),
                OptionsContainer(items: provider.marketingAdsItems(context)),
                SizedBox(height: 16.h),

                CustomTitle(title: 'Business & Reports'),
                SizedBox(height: 16.h),
                OptionsContainer(items: provider.businessReportsItems(context)),
                SizedBox(height: 16.h),

                CustomTitle(title: 'Help & Settings'),
                SizedBox(height: 16.h),
                OptionsContainer(items: provider.settingsItems(context)),
                SizedBox(height: 16.h),
                OptionsContainer(
                  noArrow: true,
                  items: [
                    {'title': 'Logout', 'icon': logoutCircle},
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DraggableButton(
        title: 'Add New Category',
        onPressed: () {},
      ),
    );
  }
}
