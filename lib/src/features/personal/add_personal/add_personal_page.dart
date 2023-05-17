import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/features/personal/add_personal/widgets/add_personal_page_appbar.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../models/personal_model.dart';
import 'widgets/add_card_personal_page.dart';
import 'widgets/add_personal_page_instructions.dart';
import 'widgets/add_personal_page_item_card.dart';

class AddPersonalPage extends StatefulWidget {
  const AddPersonalPage({Key? key}) : super(key: key);

  @override
  State<AddPersonalPage> createState() => _AddPersonalPageState();
}

class _AddPersonalPageState extends State<AddPersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const AddPersonalPageAppbar(),
      ),
      body: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 0.5.h,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return GridView.builder(
              itemCount: data.personals.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (context, index) {
                return index == 0
                    ? const AddCardPersonalPage()
                    : PersonalPageItemCard(
                        index: index - 1, data: data.personals[index - 1]);
              });
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showMyDialog(context);
    });
  }

  void showMyDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 1),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return const AddPersonalPageInstructions();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
