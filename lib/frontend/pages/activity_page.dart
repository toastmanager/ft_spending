import 'package:flutter/material.dart';

import 'package:ft_spending/frontend/global/app_style.dart' as app_style;
import 'package:ft_spending/backend/models/ActivityModel.dart';

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
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categories[index].activityName, style: app_style.h1TextStyle,),
                        Image.network(categories[index].image, width: 500,),
                        Text('Описание:\n${categories[index].activityDesc}', style: app_style.pTextStyle,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 50,),
                  _actionInfoSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _actionInfoSection() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Тип занятия: ' + categories[index].activityType),
                    Text('Оценка: #оценка#/5 ( #сколько отзывов# отзыва(ов))'),
                    Text('Телефон: ' + categories[index].phone),
                    Text('Возрастные ограничения: ' + '#тут возрастные ограничения#')
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  width: 470,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextField(),
                      // TextField(),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Text('Отправить комментарий', style: TextStyle(color: Colors.white),)
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Никита Громов', style: app_style.focusTextStyle,),
                              Text('Комментарий долгий долгий долгий долгий долгий долгий долгий долгий', style: app_style.pTextStyle,)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
  }
}