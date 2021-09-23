import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:toasta/provider.dart';

import 'model.dart';

class ToastElement extends StatefulWidget {
  const ToastElement({Key? key, required this.element}) : super(key: key);

  final Toast element;
  @override
  _ToastElementState createState() => _ToastElementState();
}

class _ToastElementState extends State<ToastElement>
    with TickerProviderStateMixin {
  late final AnimationController _startController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late final Animation<Offset> _startOffsetFloat =
      Tween(begin: Offset(0.0, -0.20), end: Offset.zero).animate(
    CurvedAnimation(
      parent: _startController,
      curve: Curves.easeOutQuint,
    ),
  );
  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.easeOutQuint,
  );

  @override
  void initState() {
    _startController.forward();
    _scaleController.forward();
    Future.delayed(Duration(seconds: 2), () {
      disappear();
    });
    super.initState();
  }

  void disappear() {
    _startController.reverse().then((value) {
      if (widget.element.onExit != null) {
        widget.element.onExit!();
      }
      ToastaProvider toastaProvider =
          Provider.of<ToastaProvider>(context, listen: false);
      toastaProvider.pop();
    });
  }

  @override
  void dispose() {
    _startController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _startOffsetFloat,
      child: ScaleTransition(
        scale: _animation,
        alignment: FractionalOffset.topCenter,
        child: Align(
          alignment: FractionalOffset.topCenter,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  boxShadow: widget.element.darkMode == true
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            spreadRadius: 3,
                            blurRadius: 20,
                            offset: Offset(0, 9),
                          )
                        ]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: widget.element.darkMode == true
                      ? Colors.grey
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
                  _startController.reverse();
                  if (widget.element.onTap != null) {
                    widget.element.onTap!();
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 56,
                    child: Column(
                      children: [
                        widget.element.title.runtimeType == String
                            ? Expanded(
                                child: Marquee(
                                  blankSpace: 32,
                                  fadingEdgeStartFraction: 0.1,
                                  fadingEdgeEndFraction: 0.1,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  text: widget.element.title ?? '',
                                ),
                              )
                            : widget.element.title,
                        widget.element.subtitle.runtimeType == String
                            ? Text(
                                widget.element.subtitle ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              )
                            : widget.element.subtitle,
                        const SizedBox(height: 8)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
