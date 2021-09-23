import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

class Toast {
  bool? darkMode;
  dynamic title;
  dynamic subtitle;
  Icon? icon;
  VoidCallback? onTap;
  VoidCallback? onExit;
  ToastStatus? status;

  Toast(
      {this.title,
      this.subtitle,
      this.icon,
      this.onTap,
      this.onExit,
      this.darkMode});
}
