import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import '../../../widget/add_image_bookmark.dart';

class HeaderBookmarkSublist extends StatelessWidget {
  const HeaderBookmarkSublist({
    super.key,
    // required this.file,
    required this.index,
  });

  // final File? file;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return GestureDetector(
        onTap: () {
          updateHeader(context, index);
        },
        child: Column(
          children: [
            (data.bookmarks[index].image == null ||
                    data.bookmarks[index].image == "")
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Constances.customCameraImage,
                      // color: Colors.white38,
                      fit: BoxFit.cover,
                      height: 50.sp,
                      width: 50.sp,
                    ),
                  )
                : CircleAvatar(
                    radius: 30.sp, // Image radius
                    backgroundImage: Image.file(
                      File(data.bookmarks[index].image ?? ""),
                    ).image,
                  ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              (data.bookmarks[index].title==""||data.bookmarks[index].title==null)?"File name":"${data.bookmarks[index].title}",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white54,
                  ),
            ),
          ],
        ),
      );
    });
  }

  void updateHeader(context, index) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AddImageTitleBookmark(
            index: index,
          );
        });
  }
}
