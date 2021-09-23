import 'package:flutter/material.dart';

import 'model/model.dart';

class ToastElement extends StatefulWidget {
  const ToastElement({Key? key, required this.element}) : super(key: key);

  final Toast element;
  @override
  _ToastElementState createState() => _ToastElementState();
}

class _ToastElementState extends State<ToastElement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
      ),
      onPressed: () {},
      child: Text('ElevatedButton with custom elevations'),
    );
  }
}
