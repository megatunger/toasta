import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:toasta/provider.dart';

import 'enum.dart';
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
    duration: const Duration(milliseconds: 350),
  );
  late final AnimationController _fadeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late final Animation<Offset> _startOffsetFloat =
      Tween(begin: const Offset(0.0, -0.20), end: Offset.zero).animate(
    CurvedAnimation(
      parent: _startController,
      curve: Curves.easeOutQuint,
      reverseCurve: Curves.easeIn,
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
  late Timer disappearTimer;
  @override
  void initState() {
    _startController.forward().then((_) {
      if (widget.element.onAppear != null) {
        widget.element.onAppear!();
      }
    });
    _scaleController.forward();
    if (widget.element.fadeInSubtitle == false) {
      _fadeController.duration = const Duration(milliseconds: 0);
      _fadeController.forward();
    } else {
      Future.delayed(const Duration(milliseconds: 200), () {
        _fadeController.forward();
      });
    }
    disappearTimer = Timer(
        widget.element.duration != null
            ? widget.element.duration!
            : const Duration(seconds: 3), () {
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
              margin: kIsWeb ? const EdgeInsets.only(top: 16) : null,
              decoration: BoxDecoration(
                  borderRadius: widget.element.borderRadius != null
                      ? widget.element.borderRadius!
                      : const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                  boxShadow: widget.element.darkMode == true
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            spreadRadius: 3,
                            blurRadius: 20,
                            offset: const Offset(0, 9),
                          )
                        ]),
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  print("TOASTA");
                  print(details.delta);
                  print(details.localPosition);
                  print(details.globalPosition);

                  _startController.value += details.delta.dy / 56;
                  // int sensitivity = 8;
                  // if (details.delta.dy > sensitivity) {
                  // } else if (details.delta.dy < -sensitivity) {
                  //   disappearTimer.cancel();
                  //   disappear();
                  // }
                },
                onVerticalDragEnd: (dragEndDetail) {
                  if (_startController.value < 0.5) {
                    disappearTimer.cancel();
                    disappear();
                  } else {
                    _startController.forward();
                  }
                },
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
                    if (widget.element.onTap != null) {
                      widget.element.onTap!();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6),
                    child: SizedBox(
                      width: widget.element.width != null
                          ? widget.element.width!
                          : MediaQuery.of(context).size.width > 640
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.width * 0.7,
                      height: widget.element.height != null
                          ? widget.element.height!
                          : 56,
                      child: Row(
                        children: [
                          if (widget.element.leading != null)
                            widget.element.leading!,
                          ...toastStatus(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                toastTitle(),
                                ...toastSubtitle(),
                              ],
                            ),
                          ),
                          if (widget.element.trailing != null)
                            widget.element.trailing!,
                        ],
                      ),
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

  Color toastBackgroundColor() {
    if (widget.element.backgroundColor != null) {
      return widget.element.backgroundColor!;
    }
    return widget.element.darkMode == true ? Colors.grey : Colors.white;
  }

  List<Widget> toastStatus() {
    if (widget.element.status != null) {
      Widget icon = Container();
      switch (widget.element.status) {
        case ToastStatus.failed:
          icon = const CircleAvatar(
              backgroundColor: Colors.red,
              child:
                  Icon(Icons.highlight_remove, size: 20, color: Colors.white));
          break;
        case ToastStatus.warning:
          icon = const CircleAvatar(
              backgroundColor: Colors.yellow,
              child:
                  Icon(Icons.warning_rounded, size: 20, color: Colors.black));
          break;
        case ToastStatus.success:
          icon = const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check_rounded, size: 20, color: Colors.white));
          break;
        case ToastStatus.info:
          icon = const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.info_outline, size: 20, color: Colors.white));
          break;
        default:
          break;
      }

      return [
        SizedBox(
          width: 32,
          height: 32,
          child: icon,
        ),
        const SizedBox(width: 10),
      ];
    }
    return [];
  }

  Widget toastTitle() {
    if (widget.element.title == null) {
      return Container();
    }
    return widget.element.title.runtimeType == String
        ? Expanded(
            child: Marquee(
              blankSpace: 32,
              fadingEdgeStartFraction: 0.05,
              fadingEdgeEndFraction: 0.05,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              text: widget.element.title ?? '',
            ),
          )
        : widget.element.title;
  }

  List<Widget> toastSubtitle() {
    if (widget.element.subtitle == null) {
      return [Container()];
    }
    return [
      FadeTransition(
          opacity: _fadeController.drive(CurveTween(curve: Curves.easeInOut)),
          child: widget.element.subtitle.runtimeType == String
              ? Text(
                  widget.element.subtitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                )
              : widget.element.subtitle),
      const SizedBox(height: 8)
    ];
  }
}
