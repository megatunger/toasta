import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Toast {
  String? title;
  String? subtitle;
  Icon? icon;
  VoidCallback? onTap;
  VoidCallback? onExit;

  Toast({this.title, this.subtitle, this.icon, this.onTap, this.onExit});
}
