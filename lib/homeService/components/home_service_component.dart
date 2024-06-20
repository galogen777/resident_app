import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:resident_app/homeService/custom_widget/space.dart';
import 'package:resident_app/main.dart';
import 'package:resident_app/homeService/models/services_model.dart';
import 'package:resident_app/homeService/screens/service_providers_screen.dart';
import 'package:resident_app/homeService/utils/colors.dart';

class HomeServiceComponent extends StatefulWidget {
  @override
  State<HomeServiceComponent> createState() => _HomeServiceComponentState();
}

class _HomeServiceComponentState extends State<HomeServiceComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 0),
        children: List.generate(
          serviceProviders.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
              );
              for (var i = 0; i < serviceProviders.length; i++) {
                if (i == index) {
                  serviceProviders[i].isSelected = true;
                } else {
                  serviceProviders[i].isSelected = false;
                }
                setState(() {});
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: serviceProviders[index].isSelected ? blackColor : textFieldColor,
                      child: Observer(
                        builder: (context) {
                          return Icon(
                            serviceProviders[index].serviceIcon,
                            size: 28,
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : serviceProviders[index].isSelected
                                    ? whiteColor
                                    : blackColor,
                          );
                        },
                      ),
                    ),
                  ),
                  Space(8),
                  FittedBox(child: Text(serviceProviders[index].subName)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
