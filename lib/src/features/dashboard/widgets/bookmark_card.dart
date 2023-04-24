import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
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
          vertical: 1.h,
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageItem(
                    image: Constances.internetImage,
                    onTap: () {},
                  ),
                  imageItem(
                    image: Constances.figmaImage,
                    onTap: () {},
                  ),
                  imageItem(
                    image: Constances.studyIQImage,
                    onTap: () {},
                  ),
                  imageItem(
                    image: Constances.adobeImage,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
