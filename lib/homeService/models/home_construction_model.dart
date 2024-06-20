import 'package:flutter/material.dart';

import 'common_model.dart';

List<CommonModel> homeConstruction = getHomeConstruction();

List<CommonModel> getHomeConstruction() {
  List<CommonModel> homeConstruction = [];
  homeConstruction.add(CommonModel.withoutImage("Поломка", Icon(Icons.construction, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Помощь ИТ", Icon(Icons.computer_sharp, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Клининг", Icon(Icons.cleaning_services_sharp, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Сканировать", Icon(Icons.qr_code, size: 30)));
  // homeConstruction.add(CommonModel.withoutImage("Contractor", Icon(Icons.person, size: 30)));

  return homeConstruction;
}
