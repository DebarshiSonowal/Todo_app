import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/custom_note.dart';

class notesCard extends StatelessWidget {
  const notesCard({
    super.key,
    required this.image,
    required this.list,
    required this.onTap,
    required this.name,
  });

  final String image, name;
  final List<CustomNote> list;
  final Function onTap;

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
                              fontSize: 15.sp,
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = list[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              item.amount ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        );
                      },
                      itemCount: list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 0.4.h,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}