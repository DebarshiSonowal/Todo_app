import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../constants/routes.dart';
import '../../widget/add_image_bookmark.dart';
import '../bookmark_list/widgets/bookmark_appbar.dart';
import 'widgets/header_bookmark_sublist.dart';

class BookmarkSublistPage extends StatefulWidget {
  const BookmarkSublistPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BookmarkSublistPage> createState() => _BookmarkSublistPageState();
}

class _BookmarkSublistPageState extends State<BookmarkSublistPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.5.h),
        child: const BookmarkAppbar(),
      ),
      // backgroundColor: Constances.blueBackground,
      body: Container(
        color: Constances.blueBackground,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderBookmarkSublist(

                index: widget.index,
              ),
              Divider(
                thickness: 0.04.h,
                color: Colors.white54,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = data.bookmarks[widget.index].items![index];
                  return BookmarkSublistItem(
                    item: item,
                    index: widget.index,
                    index2: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0.04.h,
                    color: Colors.white54,
                  );
                },
                itemCount: data.bookmarks[widget.index].items?.length ?? 0,
              ),
              Divider(
                thickness: 0.04.h,
                color: Colors.white54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigation.instance.navigate(
                          Routes.addBookmarkSubItem,
                          args: widget.index,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18.sp,
                      )),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class BookmarkSublistItem extends StatelessWidget {
  const BookmarkSublistItem({
    super.key,
    required this.item,
    required this.index,
    required this.index2,
  });

  final BookmarkSubItem item;
  final int index, index2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.instance
            .navigate(Routes.editBookmark, args: "$index,$index2");
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title ?? "",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                ),
                SvgPicture.asset(
                  Constances.editIcon,
                  color: Colors.white,
                  fit: BoxFit.fill,
                  height: 14.sp,
                  width: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    item.link ?? "",
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white70,
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
                const Icon(Icons.more_horiz)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
