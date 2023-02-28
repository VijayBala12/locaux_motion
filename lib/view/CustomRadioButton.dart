import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:locaux_motion/model/option.dart';

class CustomRadio extends StatelessWidget {
  Option _option;

  CustomRadio(this._option);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _option.isSelected ?  const Color.fromARGB(255, 0, 94, 85) : Colors.white,
        child: Container(
          height: 80,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _option.icon != null
                  ? Icon(
                      _option.icon,
                      color: _option.isSelected ? Colors.white :  const Color.fromARGB(255, 0, 94, 85),
                      size: 40,
                    )
                  : Container(),
              SizedBox(height: 10),
              Text(
                _option.name,
                style: TextStyle(
                    color: _option.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}

class OptionSelector extends StatefulWidget {
  @override
  _OptionSelectorState createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {

  List<Option> options = [
    Option(name: "Bus", icon: Icons.bus_alert_rounded, isSelected: false),
    Option(name: "Train", icon: Icons.train_rounded, isSelected: false),
    Option(name: "Tram", icon: Icons.tram_rounded, isSelected: false),
    Option(
        name: "Vélo", icon: Icons.directions_bike_rounded, isSelected: false),
    Option(
        name: "Trotinette",
        icon: Icons.electric_scooter_rounded,
        isSelected: false),
    Option(
        name: "Scooter", icon: Icons.bike_scooter_outlined, isSelected: false),
    Option(name: "Voiture", icon: Icons.car_repair_outlined, isSelected: false),
    Option(name: "Tous", isSelected: true)
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var option = options[index];
          return InkWell(
            onTap: () {
              setState(() {
                if (option.name == "Tous") {
                  for (var element in options) {element.isSelected = false;}
                } else {
                  options[7].isSelected = false;
                }
                option.isSelected = !option.isSelected;
              });
            },
            child: CustomRadio(options[index]),
          );
        });
  }

  void scheduleRebuild() => setState(() {});
}
