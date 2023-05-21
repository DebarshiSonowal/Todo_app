import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/essential_note.dart';

class AddEssentialPageItem extends StatelessWidget {
  const AddEssentialPageItem({
    super.key,
    required this.item,
    required this.index,
    required this.update,
  });

  final EssentialNote item;
  final int index;
  final Function(String) update;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${index + 1}. ",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily: "Roboto",
              ),
        ),
        Expanded(
          child: TextFormField(
            maxLines: 1,
            onFieldSubmitted: (val) {
              if (val.isNotEmpty) {
                update(val);
              }
            },
            initialValue: "${item.title}",
            minLines: 1,
            decoration: InputDecoration.collapsed(
              hintText: 'Write something',
              hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black54,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
            ),
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontFamily: "Roboto",
                ),
          ),
        ),
      ],
    );
  }
}

class DetailsEssentialPageItem extends StatelessWidget {
  const DetailsEssentialPageItem({
    super.key,
    required this.item,
    required this.index,
    required this.update,
    required this.updateCheckBox,
  });

  final EssentialNote item;
  final int index;
  final Function(String) update;

  final Function(bool) updateCheckBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>updateCheckBox(!(item.isCompleted ?? false)),
      child: Row(
        children: [
          Text(
            "${index + 1}. ",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black54,
                  fontFamily: "Roboto",
                ),
          ),
          Expanded(
            child: Text(
              "${item.title}",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontFamily: "Roboto",
                  ),
            ),
            // child: TextFormField(
            //   maxLines: 1,
            //   onFieldSubmitted: (val) {
            //     if (val.isNotEmpty) {
            //       update(val);
            //     }
            //   },
            //   initialValue: "${item.title}",
            //   minLines: 1,
            //   decoration: InputDecoration.collapsed(
            //     hintText: '${index + 1}.',
            //     hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
            //           fontSize: 12.sp,
            //           color: Colors.black54,
            //           // fontWeight: FontWeight.bold,
            //           fontFamily: "Roboto",
            //         ),
            //   ),
            //   style: Theme.of(context).textTheme.headline4?.copyWith(
            //         fontSize: 12.sp,
            //         color: Colors.black,
            //         fontFamily: "Roboto",
            //       ),
            // ),
          ),
          SizedBox(
            height: 1.h,
            child: Checkbox(
                splashRadius: 2.w,
                activeColor: Colors.green,
                value: item.isCompleted ?? false,
                onChanged: (val) => updateCheckBox(val ?? false)),
          ),
        ],
      ),
    );
  }
}
