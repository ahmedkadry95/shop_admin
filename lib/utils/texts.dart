import 'package:flutter/material.dart';

Widget blackTitle1(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}

Widget blackTitle2(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}

Widget blackTitle3(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}

Widget smallGreyHint(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
  );
}
