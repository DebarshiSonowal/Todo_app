import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../models/stacked_list_item_model.dart';

class StackedSheetItem extends StatelessWidget {
  const StackedSheetItem({
    super.key,
    required this.item, required this.onTap,
  });

  final StackedListItemModel item;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Row(
        children: [
          Image.asset(
            item.image!,
            scale: 3.5,
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            item.name ?? "",
            style:
            Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 15.sp,
              color: Colors.white,
              fontFamily: "PublicSans",
              // fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Image.asset(
            Constances.arrowNextImage,
            fit: BoxFit.fill,
            scale: Constances.arrowScale2,
          ),
        ],
      ),
    );
  }
}