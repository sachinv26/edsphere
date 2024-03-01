import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/core/utils/size_utils.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:schoolapp/theme/app_decoration.dart';
import 'package:schoolapp/theme/custom_text_style.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';

import '../theme/theme_helper.dart';
class StudentInfoWidget extends StatefulWidget {
  @override
  State<StudentInfoWidget> createState() => _StudentInfoWidgetState();
}

class _StudentInfoWidgetState extends State<StudentInfoWidget> {
  StudentBasic? student;

  @override
  void initState() {
    // TODO: implement initState
    student = AuthenticateUser.studentBasic!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.outlineBluegray10001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: '${student?.photo}',
                      fit: BoxFit.cover,
                      // height: 30,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                    ),
                  ),
                  radius: 30,
                  // backgroundImage: CachedNetworkImage(,imageUrl:'${studentBirthday?.photo}' ),
                ),
                height: 64.adaptSize,
                width: 64.adaptSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 9.v),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${student?.firstName}',
                        style: CustomTextStyles.titleMediumBold,
                      ),
                      SizedBox(height: 5.v),
                      Row(
                        children: [
                          Text(
                            "Father: ",
                            style: CustomTextStyles.labelLargeBlack900,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text(
                              '${AuthenticateUser.studentFamily?.fName}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.v),
                      Padding(
                        padding: EdgeInsets.only(right: 1.h),
                        child: Row(
                          children: [
                            Text(
                              'Class- ' +
                                  '${student?.kclass} ' +
                                  "Section- " +
                                  '${student?.section} ',
                              style: CustomTextStyles.labelLargeMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 1.v,
                                bottom: 1.v,
                              ),
                              child: Text(
                                "Roll No- " + '${student?.rollNo}',
                                style: CustomTextStyles.labelLargeMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.v),
        ],
      ),
    );
  }
}
