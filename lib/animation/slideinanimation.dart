import 'package:flutter/cupertino.dart';

class Slidein extends StatefulWidget {
  int duration;
  Widget child;

  Slidein({this.duration, this.child});

  @override
  _SlideinState createState() => _SlideinState();
}

class _SlideinState extends State<Slidein>with SingleTickerProviderStateMixin {
  AnimationController controller ;
  Animation<Offset> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds:widget.duration));
    setanimation(controller);
    controller.forward();

  }
  void setanimation(AnimationController control) {
    animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end:  Offset.zero,
    ).animate(CurvedAnimation(
      parent: control,
      curve: Curves.ease,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:animation,
      child: widget.child,
    );
  }
}
