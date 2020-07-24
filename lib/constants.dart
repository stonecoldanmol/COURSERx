import 'package:flutter/material.dart';

// Colors
const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: Color(0xFF6E8AFA),
  fontFamily: 'Alesandra',
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(1.5, 1.5),
      blurRadius: 0.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Shadow(
      offset: Offset(1.5, 1.5),
      blurRadius: 0.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  fontFamily: 'Nunito',
  color: Color(0xFF0D1333),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: 15,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
