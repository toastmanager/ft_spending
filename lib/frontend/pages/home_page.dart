import 'package:flutter/material.dart';
import 'dart:html' as html;

// Style
import 'package:ft_spending/frontend/global/app_style.dart' as app_style;

// Models
import 'package:ft_spending/backend/models/ActivityModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<ActivityModel> categories = [];

  void _getInitialInfo() {
    categories = ActivityModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mainActivity(context, categories[5].index),
          const SizedBox(height: 50,),
          _activityListView('Волонтёрство'),
          const SizedBox(height: 50,),
          _activityListView('Лагеря'),
          const SizedBox(height: 50,),
          _activityListView('Секции и кружки'),
          const SizedBox(height: 50,),
          _activityListView('Подработка'),
          const SizedBox(height: 50,),
          _activityListView('Мероприятия'),
        ],
      ),
    );
  }

  Column _activityListView(
    String _listActivityType,
  ) {
    Color _cardColor = Colors.red;
    List<ActivityModel> _currentActivities = [];

    switch (_listActivityType) {
      case 'Волонтёрство':
        categories.forEach((element) {
          if (element.activityType == app_style.volunteerType) {
            _currentActivities.add(element);
          }
        });
      break;
      case 'Лагеря':
        categories.forEach((element) {
          if (element.activityType == app_style.campType) {
            _currentActivities.add(element);
          }
        });
      break;
      case 'Секции и кружки':
        categories.forEach((element) {
          if (element.activityType == app_style.sectionType) {
            _currentActivities.add(element);
          }
        });
      break;
      case 'Подработка':
        categories.forEach((element) {
          if (element.activityType == app_style.workType) {
            _currentActivities.add(element);
          }
        });
      break;
      case 'Мероприятия':
        categories.forEach((element) {
          if (element.activityType == app_style.eventType) {
            _currentActivities.add(element);
          }
        });
      break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text(
            _listActivityType,
            style: app_style.focusTextStyle,
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          height: 320,
          color: Color.fromARGB(8, 0, 0, 0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _currentActivities.length,
            separatorBuilder: (context, index) => SizedBox(width: 60,),
            itemBuilder: (context, index) {
              return _activityCard(
                context,
                _currentActivities[index].index,
                _currentActivities[index].cardColor,
                _currentActivities[index].image,
                _currentActivities[index].activityName,
                _currentActivities[index].activityDesc,
                _currentActivities[index].phone,
                _currentActivities[index].adress,
              );
            },
          ),
        )
      ],
    );
  }

  MouseRegion _activityCard(
    BuildContext context,
    int _index,
    Color _cardColor,
    String _image,
    String _activityName,
    String _activityDesc,
    String _phone,
    String _adress,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/activity/$_index',);
          html.window.history.pushState(null, 'activity', '#/activity/$_index');
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 350,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Image.network(
                          _image,
                          fit: BoxFit.cover,
                          width: constraints.maxWidth,
                          height: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox();
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(_activityName, style: app_style.focusTextStyle,),
                  Text(_activityDesc, style: app_style.pTextStyle,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Номер: ' + _phone),
                  Text('Адрес: ' + _adress),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  MouseRegion _mainActivity(
    BuildContext context,
    int _index,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/activity/$_index',);
          html.window.history.pushState(null, 'activity', '#/activity/$_index');
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20
              )
            ]
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://images.jpost.com/image/upload/f_auto,fl_lossy/t_JM_ArticleMainImageFaceDetect/504208',
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  fit: BoxFit.cover,
                  color: Colors.black26,
                  colorBlendMode: BlendMode.darken,
                ),
                Column(
                  children: [
                    Text('Активность недели:', style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      shadows: [
                        Shadow(blurRadius: 6)
                      ]
                    ),),
                    Text('Летний лагерь "Солнышко"',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow( blurRadius: 6, ),
                        ]
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}