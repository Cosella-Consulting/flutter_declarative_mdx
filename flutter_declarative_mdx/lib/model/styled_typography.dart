import 'package:flutter/material.dart';

class StyledTypography {
  final TextStyle? paragraph;
  final List<TextStyle>? headings;
  final TextStyle? code;
  final TextStyle? preformatted;

  StyledTypography({
    this.paragraph,
    this.headings,
    this.code,
    this.preformatted,
  });
}
