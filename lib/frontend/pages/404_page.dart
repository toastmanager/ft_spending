import 'package:flutter/material.dart';

import 'package:ft_spending/frontend/global/app_style.dart' as app_style;

Route<dynamic> NotFoundPage() {
  return MaterialPageRoute(
    builder: (context) {
      return Container(
        child: Center(
          child: Text(
            'Похоже что такой страницы не существует',
            style: app_style.focusTextStyle,
          ),
        ),
      );
    }
  );
}