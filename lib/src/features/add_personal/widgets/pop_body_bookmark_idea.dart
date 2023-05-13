import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopUpBodyPersonal extends StatelessWidget {
  const PopUpBodyPersonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 84.w,
      margin: EdgeInsets.only(
        right: 0.w,
        bottom: 0.5.h,
      ),
      padding: EdgeInsets.all(
        8.5.w,
      ),
      child: Container(
        // padding: EdgeInsets.only(
        //   right: 5.w,
        //   bottom: 4.h,
        // ),
        color: Colors.white,
        // height: 33.h,
        // width: 70.w,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // color: const Color(0xffccd3db),
              height: 3.5.h,
              padding: EdgeInsets.only(
                bottom: 0.1.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Personal",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: Divider(
                thickness: 0.05.h,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create what you're",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    Text(
                      "looking for more",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    Text(
                      "quick and easily",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Classes",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color(0xff8338A8),
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "e.g. Tuition,Coaching,OnlineCourses",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Meeting",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color(0xffFF72B6),
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "e.g. Online meeting,private,meeting",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Task",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color(0xff5D96EA),
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "e.g. Project,plan,Development,deadline",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Bills",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color(0xffC0292C),
                            fontSize: 10.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "e.g. Rent, electricity, water",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: "ABeeZee",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff3fcbd8),
              height: 6.5.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Have more ideas",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
                  ),
                  Text(
                    "keep adding",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
