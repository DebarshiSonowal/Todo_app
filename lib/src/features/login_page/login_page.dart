import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';
import 'package:vishal_todo_app/src/widget/done_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constances.loginBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigation.instance.goBack();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_up_sharp,
                      size: 38.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 38.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                height: 30.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an Account',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 17.sp,
                            color: Color(0xff0f1c3d),
                            // fontWeight: FontWeight.w700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'sign up to continue',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff48538e),
                          ),
                        ),
                        // hintText: 'Tell us about yourself',
                        hintStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                        // helperText: 'Keep it short, this is just a demo.',
                        labelText: 'Email',
                        labelStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                        // prefixIcon: const Icon(
                        //   Icons.person,
                        //   color: Colors.green,
                        // ),
                        prefixText: ' ',
                        // suffixText: 'USD',
                        // suffixStyle: const TextStyle(color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff48538e),
                          ),
                        ),
                        // hintText: 'Tell us about yourself',
                        hintStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                        // helperText: 'Keep it short, this is just a demo.',
                        labelText: 'Password',
                        labelStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                        // prefixIcon: const Icon(
                        //   Icons.person,
                        //   color: Colors.green,
                        // ),
                        prefixText: ' ',
                        // suffixText: 'USD',
                        // suffixStyle: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Constances.blueBackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),

                  width: 60.w, // <-- Your width
                  // height: 2.h,
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: Center(
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontFamily: "Roboto",
                        // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/f218e524-3a32-40d5-88f3-bb74bc35b283');
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
