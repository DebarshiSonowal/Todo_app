import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../services/Navigate.dart';
import '../../../bookmark/bookmark_list/widgets/popup_body.dart';
import 'pop_up_body_essential.dart';

class EssentialPageInstructions extends StatelessWidget {
  const EssentialPageInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigation.instance.goBack(),
      child: Material(
        color: Colors.transparent,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const PopUpBodyEssential(),
                Container(
                  margin: EdgeInsets.only(
                    // right: 52.w,
                    // top: 3.h,
                    bottom: 1.h,
                  ),
                  padding: EdgeInsets.only(
                    bottom: 1.5.h,
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
