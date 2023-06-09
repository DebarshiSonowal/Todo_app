import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/routes.dart';
import '../bookmark_list/widgets/bookmark_appbar.dart';
import 'widgets/bookmark_sublits_item.dart';
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
        preferredSize: Size.fromHeight(9.h),
        child: const BookmarkAppbar(),
      ),
      body: Container(
        color: Constances.blueBackground,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          // horizontal: 1.w,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderBookmarkSublist(
                  index: widget.index,
                ),
                Divider(
                  thickness: 0.04.h,
                  color: Colors.white54,
                ),
                SizedBox(
                  height: 67.h,
                  child: data.bookmarks.isEmpty
                      ? EmptyList()
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item =
                                data.bookmarks[widget.index].items![index];
                            return Column(
                              children: [
                                BookmarkSublistItem(
                                  item: item,
                                  index: widget.index,
                                  index2: index,
                                ),
                                (index) ==
                                        ((data.bookmarks[widget.index].items
                                                    ?.length ??
                                                0) -
                                            1)
                                    ? Divider(
                                        thickness: 0.04.h,
                                        color: Colors.white54,
                                      )
                                    : Container(),
                                index ==
                                        ((data.bookmarks[widget.index].items
                                                    ?.length ??
                                                0) -
                                            1)
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          right: 2.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 0.04.h,
                              color: Colors.white54,
                            );
                          },
                          itemCount: data.bookmarks.isEmpty
                              ? 0
                              : (data.bookmarks[widget.index].items?.length) ??
                                  0,
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Column EmptyList() {
    return Column(
      children: [
        // Divider(
        //   thickness: 0.04.h,
        //   color: Colors.white54,
        // ),
        Padding(
          padding: EdgeInsets.only(
            right: 2.w,
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.end,
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
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
