import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../services/Navigate.dart';
import 'pop_body_bookmark_idea.dart';

class AddPersonalPageInstructions extends StatelessWidget {
  const AddPersonalPageInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              const PopUpBodyPersonal(),
              Container(
                margin: EdgeInsets.only(
                  right: 45.w,
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
    );
  }
}