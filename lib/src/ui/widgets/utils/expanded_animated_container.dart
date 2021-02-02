import 'package:flutter/material.dart';

class ExpandedAnimatedContainer extends StatefulWidget {
  ExpandedAnimatedContainer({
    @required this.child,
    this.expanded,
    this.curve = Curves.easeInOutQuart,
    this.duration = const Duration(milliseconds: 750),
    Key key,
  }) : super(key: key);

  final Widget child;
  final Curve curve;
  final bool expanded;
  final Duration duration;

  @override
  _ExpandedAnimatedContainerState createState() =>
      _ExpandedAnimatedContainerState();
}

class _ExpandedAnimatedContainerState extends State<ExpandedAnimatedContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(curve: widget.curve, parent: _controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    (widget.expanded) ? _controller.forward() : _controller.reverse();
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: _animation,
      child: widget.child,
      axis: Axis.vertical,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
