import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../constants/routes.dart';
import '../../services/Navigate.dart';
import '../../widget/alert.dart';
import '../bookmark_list/widgets/bookmark_appbar.dart';

class EditBookmarkPage extends StatefulWidget {
  const EditBookmarkPage({Key? key, required this.index}) : super(key: key);

  final String index;

  @override
  State<EditBookmarkPage> createState() => _EditBookmarkPageState();
}

class _EditBookmarkPageState extends State<EditBookmarkPage> {
  final titleController = TextEditingController();
  final describeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      titleController.text = Provider.of<Repository>(context, listen: false)
              .bookmarks[int.parse(widget.index.split(",")[0])]
              .items![int.parse(widget.index.split(",")[1])]
              .title ??
          "";
      describeController.text = Provider.of<Repository>(context, listen: false)
              .bookmarks[int.parse(widget.index.split(",")[0])]
              .items![int.parse(widget.index.split(",")[1])]
              .link ??
          "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: BookmarkAppbar(
          saveBookmark: () {
            if (titleController.text.isNotEmpty &&
                describeController.text.isNotEmpty) {
              Provider.of<Repository>(context, listen: false)
                  .updateBookmarkItem(
                BookmarkSubItem(
                  title: titleController.text,
                  link: describeController.text,
                ),
                int.parse(widget.index.split(",")[0]),
                int.parse(widget.index.split(",")[1]),
              );
              Navigation.instance.navigateAndReplace(
                Routes.bookmarkList,
                args: Provider.of<Repository>(context, listen: false)
                        .bookmarks
                        .length -
                    1,
              );
            } else {
              showError("Title and link are required");
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 2.h,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Constances.blueBackground,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      //  showPhotoBottomSheet(getSelectedImage);
                      Container(
                        height: 8.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.5.h,
                        ),
                        decoration: const BoxDecoration(
                          color: Constances.textFieldBackground,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                          controller: titleController,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Content Title',
                            hintStyle:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white70,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                          ),
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 20.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 2.h,
                        ),
                        decoration: const BoxDecoration(
                          color: Constances.textFieldBackground,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                          controller: describeController,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Add link',
                            hintStyle:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white70,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                          ),
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showError(String msg) {
    AlertX.instance.showAlert(
        title: "Error",
        msg: msg,
        positiveButtonText: "Done",
        positiveButtonPressed: () {
          Navigation.instance.goBack();
        });
  }
}
