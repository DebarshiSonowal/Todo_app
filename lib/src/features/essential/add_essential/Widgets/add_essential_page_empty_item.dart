
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddEssentialPageEmptyItem extends StatelessWidget {
  const AddEssentialPageEmptyItem({Key? key, required this.index, required this.update}) : super(key: key);
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
          flex: 3,
          child: TextFormField(
            maxLines: 1,
            onFieldSubmitted: (val) {
              if (val.isNotEmpty) {
               update(val);
              }
            },
            minLines: 1,
            // initialValue: "${item.title}",
            decoration: InputDecoration.collapsed(
              hintText: 'Write Something',
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(
                fontSize: 12.sp,
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
              ),
            ),
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(
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
