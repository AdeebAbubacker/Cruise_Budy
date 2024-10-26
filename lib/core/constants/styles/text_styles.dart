import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final rubik = GoogleFonts.rubik();
  static final ibmmono = GoogleFonts.ibmPlexMono();

  // Naming convention: [fontFamily]_[fontSize]_[color with last 2 digits]_[fontWeight]

  static final TextStyle rubik16black24w2700 = rubik.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF242424),
  );
}
