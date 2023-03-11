import 'package:flutter/material.dart';

import 'package:ft_spending/frontend/global/app_style.dart' as app_style;
import 'package:ft_spending/backend/models/data.dart';

class ActivityPage extends StatelessWidget {
  List<ActivityModel> categories = [];
  int index = 0;

  ActivityPage({
    super.key,
    required this.index,
  });

  void _getInitialInfo() {
    categories = ActivityModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return FittedBox(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(categories[index].activityName, style: app_style.h2TextStyle,),
                Image.network(categories[index].image, width: 500,),
                Text('Описание:'),
                Text('Условия'),
              ],
            ),
            SizedBox(width: 100,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Адрес организации: ' + categories[index].adress),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20)
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {},
                  child: Text('Написать сообщение', style: TextStyle(color: Colors.white),)
                ),
                Text('Комментарии'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}