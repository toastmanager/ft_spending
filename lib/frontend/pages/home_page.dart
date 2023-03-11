import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главное'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          _searchField(),
          SizedBox(height: 50,),
          Row(
            children: [
              Container(
                width: 500,
                height: 1000,
                color: Colors.amber,
                child: Column(

                ),
              ),
              _eventLongCardList(),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _eventLongCardList() {
    return Expanded(
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemBuilder: (context, index) {
              return _eventLongCard(
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
              );
            },
          ),
        );
  }

  Container _eventLongCard(
    BuildContext context,
    String _imageAdress,
    String _name,
    String _description,
    List<Widget> _tags,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black26,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Image.network(
            _imageAdress,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: Text(
                  _description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: _tags,
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