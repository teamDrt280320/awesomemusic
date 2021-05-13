import 'package:awesomemusic/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustAppBarState createState() => _CustAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustAppBarState extends State<CustAppBar> {
  @override
  Widget build(BuildContext context) => Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 2),
            //     blurRadius: 16.0,
            //     spreadRadius: 0.9,
            //     color: kSecondaryColor.withOpacity(0.2),
            //   ),
            // ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  APPNAME,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: kTextColor,
                    fontSize: 22,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
