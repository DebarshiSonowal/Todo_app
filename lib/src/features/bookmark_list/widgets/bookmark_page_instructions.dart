import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

class BookmarkPageInstructions extends StatelessWidget {
  const BookmarkPageInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            color: Colors.white,
            height: 15.h,
            child: Column(
              children: [
                Container(
                  color: const Color(0xffccd3db),
                  height: 7.h,
                  child: Center(
                    child: Text(
                      "Bookmark ideas",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 48.w,bottom: 2.h,),
            child: IconButton(
              onPressed: () {
                Navigation.instance.goBack();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
