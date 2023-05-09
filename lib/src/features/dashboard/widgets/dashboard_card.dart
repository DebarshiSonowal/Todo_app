import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import 'routineItem.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.type,
    required this.onTapArrow,
    required this.onTapItem,
  });

  final String type;
  final Function onTapArrow;
  final Function(int) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        // padding: EdgeInsets.symmetric(
        //
        //   // vertical: 1.h,
        // ),
        decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // shape: BoxShape.circle,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constances.primaryColor,
                // border: Border.all(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                // shape: BoxShape.circle,
              ),
              padding: EdgeInsets.only(
                top: 0.5.h,
                left: 1.w,
                right: 1.w,
                bottom: 0.5.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Today's Plan",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Constances.specialTextColor,
                          fontSize: 9.5.sp,
                          fontFamily: "PublicSans",
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 3.5.h,
                    child: Row(
                      children: [
                        Image.asset(
                          Constances.clockImage,
                          height: 4.7.h,
                          width: 7.5.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          type,
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => onTapArrow(),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                            size: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.1.h,
            ),
            Consumer<Repository>(builder: (context, data, _) {
              return Container(
                width: double.infinity,
                height: 11.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = data.models[index];
                    return RoutineItem(
                      img: item.image!,
                      txt: item.title!,
                      type: 1,
                      onTap: () => onTapItem(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2.w,
                    );
                  },
                  itemCount: data.models.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
