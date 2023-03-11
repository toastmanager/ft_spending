import 'package:flutter/material.dart';
import 'package:ft_spending/frontend/global/app_style.dart' as app_style;

class ActivityModel {
  int index;
  String activityType;
  String image;
  String activityName;
  String activityDesc;
  String phone;
  String adress;
  Color cardColor;
  List<Widget> tags;

  ActivityModel({
    required this.index,
    required this.activityType,
    required this.image,
    required this.activityName,
    required this.activityDesc,
    required this.phone,
    required this.adress,
    required this.cardColor,
    required this.tags,
  });

  static List<ActivityModel> getCategories() {
    List<ActivityModel> categories = [];

    categories.add(
      ActivityModel(
        index: 0,
        activityType: app_style.sectionType,
        cardColor: app_style.eventCardColor,
        image: 'https://ss.sport-express.ru/userfiles/materials/180/1809138/volga.jpg',
        activityName: 'Тренировки с Роки Роки',
        activityDesc: 'Тренируемся по технике Роки Роки',
        phone: '+7 123 456 78 90',
        adress: 'ул. Пушкина 1, дом. Калатушкина',
        tags: [Text('Секция'), Text('14+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 1,
        activityType: app_style.sectionType,
        cardColor: app_style.eventCardColor,
        image: 'https://www.ecopravda.ru/wp-content/uploads/2023/03/Lesa-Irkutskoj-oblasti-1.png',
        activityName: 'Тренировка по лесорубке',
        activityDesc: 'Тренируемся по китайской техники',
        phone: '+7 123 456 78 90',
        adress: 'ул. Толстого 3, дом. 21',
        tags: [Text('Кружок'), Text('14+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 2,
        activityType: app_style.sectionType,
        cardColor: app_style.eventCardColor,
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Chinese_standard_variants_samples.svg/300px-Chinese_standard_variants_samples.svg.png',
        activityName: 'Кружок чтения иероглифов',
        activityDesc: 'Учимся читать китайские иероглифы',
        phone: '+7 123 456 78 90',
        adress: 'ул. Пояркова 4/3, дом. 2',
        tags: [Text('Кружок'), Text('14+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 3,
        activityType: app_style.workType,
        cardColor: app_style.workCardColor,
        image: 'https://images.squarespace-cdn.com/content/v1/5c80149692441b3fb76494f4/4fe415d8-fc34-480c-b21b-85aa88121b99/storage.jpeg',
        activityName: 'Охранник склада',
        activityDesc: 'Ночной охранник склада, оплата договорная',
        phone: '+7 123 456 78 90',
        adress: 'ул. Жиркова 9/1, дом. 2',
        tags: [Text('Подработка'), Text('18+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 4,
        activityType: app_style.volunteerType,
        cardColor: app_style.volunteerCardColor,
        image: 'https://cdnn21.img.ria.ru/images/07e6/03/03/1776350764_0:320:3072:2048_1920x0_80_0_0_49829fe089344c8ce2071873110dd69f.jpg',
        activityName: 'Общение с сиротами и обучение их творчеству',
        activityDesc: 'описание',
        phone: '+7 123 456 78 90',
        adress: 'ул. Где-то там, дом. 2',
        tags: [Text('Волонтёрство'), Text('14+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 5,
        activityType: app_style.campType,
        cardColor: app_style.campCardColor,
        image: 'https://images.jpost.com/image/upload/f_auto,fl_lossy/t_JM_ArticleMainImageFaceDetect/504208',
        activityName: 'Летний лагерь "Солнышко"',
        activityDesc: 'описание',
        phone: '+7 123 456 78 90',
        adress: 'на природе',
        tags: [Text('Лагерь'), Text('14+'),],
      )
    );

    categories.add(
      ActivityModel(
        index: 6,
        activityType: app_style.campType,
        cardColor: app_style.campCardColor,
        image: '',
        activityName: 'Летний лагерь "Easy english"',
        activityDesc: 'описание',
        phone: '+7 123 456 78 90',
        adress: 'на природе',
        tags: [Text('Лагерь'), Text('6+'),],
      )
    );

Color sectionCardColor = Color(0xffc81c17);

    return categories;
  }
}

List dataList = [
  [
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
  ],
];