import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:flutter/material.dart';

//Colors
const kPrimaryColor = Color(0xFF8185E2);
const kPrimaryLightColor = Color(0xFFd2d4f4);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFF28b32)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your phone";
const String kInvalidEmailError = "Please Enter Valid phone";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

//Strings
const String APPNAME = 'Awesome Music';
const String SETUPCOMPLETE = 'SetupComplete';
const String DOB = 'dob';
const String PHONENUMBER = 'phonenumber';
const String CLASS = 'class';
const String MEDIUM = 'medium';
const String EMAIL = 'email';
const String USERNAME = 'uname';
const String SCHOOLNAME = 'schoolname';
const String PERSONALDETAILS = 'personaldetails';
const String TEACHER = 'teacher';
const String STUDENT = 'student';
const String PDFBASEURL = "https://topperformula.com";
const String DOWNLOADPORTSEND = 'donwload_port_send';
const String DEFAULTTHUMBTAG = 'DEFAULTTHUMBTAG';

const String TOPSONGSURL =
    'https://www.jiosaavn.com/api.php?__call=webapi.get&token=8MT-LQlP35c_&type=playlist&p=1&n=30&includeMetaTags=0&ctx=web6dot0&api_version=4&_format=json&_marker=0';
const String SONGDETAILURL =
    "https://www.jiosaavn.com/api.php?app_version=5.18.3&api_version=4&readable_version=5.18.3&v=79&_format=json&__call=song.getDetails&pids=";
// ignore: non_constant_identifier_names
String LYRICSURL(songId) =>
    "https://www.jiosaavn.com/api.php?__call=lyrics.getLyrics&lyrics_id=" +
    songId +
    "&ctx=web6dot0&api_version=4&_format=json";

String searchUrl(searchQuery) =>
    "https://www.jiosaavn.com/api.php?app_version=5.18.3&api_version=4&readable_version=5.18.3&v=79&_format=json&query=" +
    searchQuery +
    "&__call=autocomplete.get";
String playlisturl(String id) =>
    "https://www.jiosaavn.com/api.php?app_version=5.18.3&api_version=4&readable_version=5.18.3&n=30&v=79&_format=json&__call=playlist.getDetails&listid=$id";

class QueueState {
  final List<MediaItem>? queue;
  final MediaItem? mediaItem;

  QueueState(this.queue, this.mediaItem);
}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}
