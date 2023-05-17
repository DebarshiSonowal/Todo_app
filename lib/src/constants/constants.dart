import 'package:flutter/material.dart';
import 'package:vishal_todo_app/src/models/stacked_list_item_model.dart';

class Constances {
  //colors
  static const bottomBarColor = Color(0xff0d132c);
  static const primaryColor = Color(0xffa6b4e2);

  //images
  static const splashScreenIcon = 'assets/images/splash_screen_icon_large.svg';
  static const splashScreenImage = 'assets/images/img_frame.svg';
  static const profileImage = 'assets/images/img_user_blue_gray_700.svg';
  static const clockImage = 'assets/images/img_clock.png';
  static const coffeeImage = 'assets/images/img_cafe.png';
  static const bathtubImage = 'assets/images/img_bathtub.png';
  static const collabImage = 'assets/images/img_collaborationfemale.png';
  static const uiImage = 'assets/images/img_image19_75x75.png';
  static const connectionImage = 'assets/images/img_image21.png';
  static const ideaImage = 'assets/images/img_idea.png';
  static const internetImage = 'assets/images/img_image26_75x72.png';
  static const adobeImage = 'assets/images/img_image24_80x79.png';
  static const figmaImage = 'assets/images/img_image23_75x75.png';
  static const studyIQImage = 'assets/images/img_image22_75x75.png';
  static const notesImage = 'assets/images/img_note.png';
  static const handImage = 'assets/images/img_handwithpen.png';
  static const pillImage = 'assets/images/img_pill.png';
  static const heartImage = 'assets/images/img_heartwithpulse.png';
  static const dumbellImage = 'assets/images/img_dumbbell.png';
  static const recycleImage = 'assets/images/img_recycle.png';
  static const diningImage = 'assets/images/img_diningroom.png';
  static const contactImage = 'assets/images/img_contacts.png';
  static const catImage = 'assets/images/img_catfootprint.png';
  static const calendarIcon = 'assets/images/img_calendar_white_a700.svg';
  static const calendarImage = 'assets/images/img_calendaricon.png';
  static const trashIcon = 'assets/images/img_trash.svg';
  static const addPhotoIcon = 'assets/images/photo.png';
  static const alarmIcon = 'assets/images/img_alarm.svg';
  static const calendarWhiteIcon = 'assets/images/img_calendar_white_a700.svg';
  static const editIcon = 'assets/images/img_edit.svg';
  static const plusIcon = 'assets/images/plus.png';
  static const addImageIcon = 'assets/images/addimage.svg';
  static const addImageImage = 'assets/images/addimage.png';
  static const customCameraImage = 'assets/images/customCamera.png';
  static const cancelImage = 'assets/images/cancel.png';
  static const shareImage = "assets/images/share.png";
  static const deleteImage = "assets/images/delete.png";

  //second
  static const backgroundImage = 'assets/images/background_blurr.png';
  static const nextImage = "assets/images/next.png";
  static const speakerImage = "assets/images/humbleicons_volume-2.png";

  //arrow
  static const arrow1Image = "assets/images/play_1.png";
  static const arrow2Image = "assets/images/play_2.png";
  static const arrowImage = "assets/images/home_arrow.png";
  static const arrowNextImage = "assets/images/arrow_next.png";
  static const arrowBackImage = "assets/images/arrow_back.png";

  //colors
  static const blueBackground = Color(0xff101939);
  static const textFieldBackground = Color(0xff232c44);

  static final listOptions = [
    StackedListItemModel(
      name: "Medicine",
      image: pillImage,
    ),
    StackedListItemModel(
      name: "Yoga",
      image: heartImage,
    ),
    StackedListItemModel(
      name: "Workout",
      image: dumbellImage,
    ),
    StackedListItemModel(
      name: "Waste sorting",
      image: recycleImage,
    ),
    StackedListItemModel(
      name: "Healthy Diet",
      image: diningImage,
    ),
    StackedListItemModel(
      name: "Reading book",
      image: contactImage,
    ),
    StackedListItemModel(
      name: "Pet",
      image: catImage,
    ),
  ];

  static const gradient = LinearGradient(
      colors: [
        gradientColor1,
        gradientColor2,
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.1],
      tileMode: TileMode.clamp);

  static const calendarCellColor1 = Color(0xff555c72);
  static const calendarCellColor2 = Color(0xff51586f);
  static const calendarCellColor3 = Color(0xffccd3dc);
  static const calendarCellColor4 = Color(0xff9ea4ab);
  static const gradientColor1 = Color(0xFF6f7487);
  static const gradientColor2 = Color(0xFF172140);
  static const cellTextColor = Color(0xFF303139);

  static const lightBlueBackground = Color(0xff233186);

  static const switchActiveColor = Color(0xff35d74b);
  static const switchDeactiveColor = Color(0xff303139);

  static const dividerColor = Color(0xff95979d);

  static const darkBlueBackground = Color(0xff101a36);

  static const specialTextColor = Color(0xff657194);
  static const selectedDateColor = Color(0xffd9d9d9);

  static const gradient1Color = Color(0xff838592);

  static const AmPmSwitchGradient = LinearGradient(
      colors: [
        Color(0xff838592),
        Color(0xff000001),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.1],
      tileMode: TileMode.clamp);

  static const editTimeSelectedCardTextColor = Color(0xffa1a5ab);

  static const splashScreenAnimation = "assets/animations/splash.gif";

  static const essentialItemColor = Color(0xffa8b4e0);

  static const essentialEditBg = Color(0xffa6b4e0);

  static const arrowScale = 18.0;

  static var arrowScale2 = 20.0;

  static const timerColor = Color(0xff596077);
}
