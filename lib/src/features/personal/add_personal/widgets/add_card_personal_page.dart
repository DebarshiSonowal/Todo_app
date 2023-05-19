
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../widget/personal_date_viewer_daily.dart';

class AddCardPersonalPage extends StatelessWidget {
  const AddCardPersonalPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigation.instance.navigate(Routes.addPersonalInfo);
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 3.w,
          ),
          decoration: const BoxDecoration(
            color: Constances.bottomBarColor,
            // border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Constances.editIcon,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              SvgPicture.asset(
                height:60.sp,
                width:70.sp,
                Constances.addImageIcon,
                color: Colors.grey[400],
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "Title",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.5.sp,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "RobotoFlex",
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 40.w,
                child: Center(
                  child: Text(
                    "DD/MM/YYYY | Hr:min",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 9.5.sp,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 3.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 1.w,
                  // ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PersonalDateViewerDaily(
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1.5.w,
                    );
                  },
                  itemCount: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}