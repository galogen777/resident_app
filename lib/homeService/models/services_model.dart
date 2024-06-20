import 'package:flutter/material.dart';
import 'package:resident_app/homeService/models/service_provider_model.dart';
import 'package:resident_app/homeService/utils/images.dart';

List<ServicesModel> serviceProviders = getServices();

class ServicesModel {
  int id;
  String serviceName;
  String subName;
  String shortDescription;
  String serviceImage;
  IconData serviceIcon;
  List<ServiceProviderModel> serviceProviders;
  bool isSelected;

  ServicesModel(this.id, this.serviceName, this.shortDescription, this.subName, this.serviceProviders, this.serviceImage, this.serviceIcon, {this.isSelected = false});
}

List<ServicesModel> getServices() {
  List<ServicesModel> list = List.empty(growable: true);
  list.add(ServicesModel(1, "Переговорные", "Who helps you in plumbing works", "Переговорные", getPlumbers(), plumber, Icons.meeting_room_sharp, isSelected: true));
  list.add(ServicesModel(2, "Маршрут", "Who helps you in electrical works", "Маршрут", getElectricians(), electrician, Icons.cable_outlined));
  list.add(ServicesModel(3, "Ресторан", "Who helps you in painting anything", "Ресторан", getPainters(), painter, Icons.restaurant));
  list.add(ServicesModel(4, "Гостевые \nпропуска", "Who helps you in carpenting works", "Гостевые \nпропуска", getCarpenters(), carpenter, Icons.person_2));
  // list.add(ServicesModel(5, "Home Cleaning", "Who helps you in cleaning the house", "Cleaning", getHomeCleaning(), homeCleaner, Icons.cleaning_services_sharp));
  // list.add(ServicesModel(5, "Car Washers", "Who helps you in cleaning the car", "Car cleaning", getHomeCleaning(), painter1, Icons.car_repair_outlined));
  // list.add(ServicesModel(6, "Car repairing", "Who helps in car repairing", "Car experts", getElectricians(), electrician, Icons.home_repair_service));
  return list;
}

void setLiked(int serviceIndex, int index) {
  if (serviceProviders[serviceIndex].serviceProviders[index].isLiked) {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = false;
    removeFavouriteProvider(serviceIndex, index);
  } else {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = true;
    addFavouriteProvider(serviceIndex, index);
  }
}
