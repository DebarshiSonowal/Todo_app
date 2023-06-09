import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import 'routineItem.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({
    super.key,
    required this.type,
    required this.onTapItem,
  });

  final String type;
  final Function(int) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
          vertical: 0.5.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // shape: BoxShape.circle,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  Constances.collabImage,
                  height: 4.h,
                  width: 8.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  type,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: "PublicSans",
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Navigation.instance.navigate(Routes.addPersonal);
                    Navigation.instance.navigate(Routes.addPersonal);
                  },
                  icon: Image.asset(
                    Constances.arrowImage,
                    // color: Colors.black54,
                    height: 10.sp,
                    width: 10.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Consumer<Repository>(builder: (context, data, _) {
              return Container(
                width: double.infinity,
                height: 10.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = data.personals[index];
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
                  itemCount: data.personals.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
