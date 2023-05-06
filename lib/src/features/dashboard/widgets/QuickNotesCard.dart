import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';

import '../../../constants/constants.dart';

class QuickNotesCard extends StatelessWidget {
  const QuickNotesCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.list,
      this.widget,
      required this.onTap,
      required this.onArrowClick})
      : super(key: key);
  final String image, name;
  final List<QuickNote> list;
  final Widget? widget;
  final Function onTap, onArrowClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: GestureDetector(
            onTap: () => onTap(),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 1.w,
              ),
              decoration: const BoxDecoration(
                color: Constances.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        image,
                        height: 4.h,
                        width: 8.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => onArrowClick(),
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 20.w,
                    height: 4.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      "${list.first.description}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
