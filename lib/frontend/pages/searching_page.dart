import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ft_spending/frontend/global/app_style.dart' as app_style;
import 'package:ft_spending/backend/bloc/search_bloc.dart' as SearchBloc;

class SearchingPage extends StatelessWidget {
  const SearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 50,),
        _searchField(),
        SizedBox(height: 50,),
        _filtersArea(context),
      ],
    );
  }

  Row _filtersArea(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30,),
          Container(
            width: 300,
            padding: EdgeInsets.only(left:30.0, top: 30.0, bottom: 30.0),
            decoration: BoxDecoration(
              color: Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Фильтры', style: app_style.focusTextStyle,),
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _checkbox(false, 'Оценка 4 и выше'),
                      Text('Зарплата или\nСредний чек', style: app_style.focusTextStyle),
                      Slider(value: 0.1, onChanged: (value) {
                        
                      },),
                      SizedBox(height: 10,),
                      Text('Тип занятия', style: app_style.focusTextStyle,),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            _checkbox(false, 'Волонтёрство'),
                            _checkbox(false, 'Лагеря'),
                            _checkbox(false, 'Секции и кружки'),
                            _checkbox(false, 'Подработка'),
                            _checkbox(false, 'Мероприятия'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30,),
          _eventLongCard(
            context,
            'https://ss.sport-express.ru/userfiles/materials/180/1809138/volga.jpg',
            'Тренировки с роки роки',
            'Будем тренироваться по технике роки роки',
            [
              Text('Волонтёрство'),
              SizedBox(width: 10,),
              Text('14+'),
              SizedBox(width: 10,),
              Text(''),
            ],
          ),
          // SizedBox(
          //   height: 500,
          //   child: BlocBuilder(
          //     builder: (context, state) => _eventLongCard(
          //       context,
          //       'https://ss.sport-express.ru/userfiles/materials/180/1809138/volga.jpg',
          //       'Тренировки с роки роки',
          //       'Будем тренироваться по технике роки роки',
          //       [
          //         Text('Волонтёрство'),
          //         SizedBox(width: 10,),
          //         Text('14+'),
          //         SizedBox(width: 10,),
          //         Text(''),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(width: 30,)
        ],
      );
  }

  Row _checkbox(
    bool _value,
    String _text,
  ) {
    return Row(
      children: [
        Checkbox(value: _value, onChanged: (value) {},),
        Text(_text, style: app_style.pTextStyle,),
      ],
    );
  }

  Expanded _eventLongCard(
    BuildContext context,
    String imageAdress,
    String name,
    String description,
    List<Widget> tags,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5,),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF2F2F2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageAdress,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: tags,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(left: 60, right: 60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.blue,
              width: 3,
            )
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              suffixIcon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Найти', style: app_style.pTextStyle,),
                      ],
                    ),
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
  }
}