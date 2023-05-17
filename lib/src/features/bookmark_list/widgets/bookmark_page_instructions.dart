import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import 'popup_body.dart';

class BookmarkPageInstructions extends StatelessWidget {
  const BookmarkPageInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigation.instance.goBack(),
      child: Material(
        color: Colors.transparent,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                const PopUpBody(),
                Container(
                  margin: EdgeInsets.only(
                    right: 52.w,
                    bottom: 2.5.h,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigation.instance.goBack();
                    },
                    icon: Image.asset(
                      Constances.cancelImage,
                      // color: Colors.black45,
                      scale: 18,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}


