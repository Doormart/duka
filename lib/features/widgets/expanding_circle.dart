import 'package:flutter/material.dart';

class ExpandingCircle extends StatefulWidget {
  final Color circleColor;

  const ExpandingCircle({Key? key, required this.circleColor})
      : super(key: key);

  @override
  State<ExpandingCircle> createState() => _ExpandingCircleState();
}

class _ExpandingCircleState extends State<ExpandingCircle>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation(){
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(seconds: 2);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child){
        return Container(
          height: height * _controller.value,
          width: width * _controller.value * 2,
          decoration: BoxDecoration(
            color: widget.circleColor,
            borderRadius: BorderRadius.circular(
                (height + width) * (1 - _controller.value),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
