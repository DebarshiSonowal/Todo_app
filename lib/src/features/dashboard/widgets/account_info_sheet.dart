import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

class accountInfoSheet extends StatelessWidget {
  const accountInfoSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoActionSheet(
        // title: const Text('Title'),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Vishal',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Colors.white,
                fontFamily: "PublicSans",
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Vikki',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Colors.white,
                fontFamily: "PublicSans",
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigation.instance.navigate(Routes.loginPage);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                SizedBox(
                  width:5.w,
                ),
                Text(
                  'Add Account',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontFamily: "PublicSans",
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}