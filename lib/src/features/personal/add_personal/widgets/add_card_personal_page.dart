
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';

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
            vertical: 1.5.h,
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
              SvgPicture.asset(
                height:55.sp,
                width:65.sp,
                Constances.addImageIcon,
                color: Colors.grey[400],
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Title',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'DD/MM/YYYY | Hr:min',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 10.sp,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}