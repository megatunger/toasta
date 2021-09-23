library toasta;

import 'package:flutter/cupertino.dart';
import 'package:toasta/toast_element.dart';

import 'model/model.dart';

enum ToastStatus {
  failed,
  warning,
  success,
  info,
}

class ToastaProvider extends InheritedWidget {
  ToastaProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  Toast? currentToasting;
  List<Toast> toastQueues = [];

  void toast(
      {required ToastStatus status,
      String? title,
      String? subtitle,
      VoidCallback? onTap}) {
    print("sdffs");
    Toast element = Toast(title: title, subtitle: subtitle, onTap: onTap);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
    throw UnimplementedError();
  }

  static ToastaProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ToastaProvider>();
  }
}

class ToastaContainer extends StatefulWidget {
  const ToastaContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  _ToastaContainerState createState() => _ToastaContainerState();
}

class _ToastaContainerState extends State<ToastaContainer> {
  @override
  Widget build(BuildContext context) {
    return ToastaProvider(
      child: Container(
        child: Stack(children: [
          if (ToastaProvider.of(context)?.currentToasting != null)
            ToastElement(element: ToastaProvider.of(context)!.currentToasting!),
          widget.child
        ]),
      ),
    );
  }
}
