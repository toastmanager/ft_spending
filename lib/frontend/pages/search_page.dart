import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        _searchField(),
        SizedBox(height: 50,),
        Row(
          children: [
            Container(
              child: Column(
                children: [
                  Text('data')
                ],
              ),
            ),
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
          ],
        )
      ],
    );
  }

  Container _eventLongCard(
    BuildContext context,
    String imageAdress,
    String name,
    String description,
    List<Widget> tags,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: Color(0xffF2F2F2),
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 130,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
    );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(left: 60, right: 60),
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
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
  }
}