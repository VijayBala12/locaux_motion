import 'dart:ffi';

import 'package:flutter/material.dart';

class Option {
  String name;
  IconData? icon;
  bool isSelected;

  Option({required this.name, this.icon, required this.isSelected});

}