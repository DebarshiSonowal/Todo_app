import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../repository/repository.dart';
import 'image_item.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({
    super.key,
  });

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
          children: [
            Row(
              children: [
                Image.asset(
                  Constances.ideaImage,
                  height: 4.h,
                  width: 8.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Bookmark Ideas",
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
                    Navigation.instance.navigate(Routes.bookmark);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.w,
              ),
              child: Consumer<Repository>(builder: (context, data, _) {
                return Container(
                  width: double.infinity,
                  height: 10.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = data.bookmarks[index];
                      return imageItem(
                        image: item.image ?? "",
                        onTap: () {
                          Navigation.instance
                              .navigate(Routes.bookmarkList, args: index);
                        },
                        text: item.title ?? "",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 3.w,
                      );
                    },
                    itemCount: data.bookmarks.length,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
