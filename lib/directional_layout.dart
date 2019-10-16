library directional_layout;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class DirectionalLayout extends StatelessWidget {
  DirectionalLayout({
    this.children,
    this.direction,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.flex = false,
    this.padding,
  });

  final List<Widget> children;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool flex;
  final dynamic padding;

  @override
  Widget build(BuildContext context) {
    final Flex _child = Flex(
      direction: direction,
      children: !flex
          ? children
          : children
              .map((x) =>
                  new Expanded(child: x, flex: x is SetFlex ? x.flex : 1))
              .toList(),
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
    );
    if (padding == null || padding == 0)
      return _child;
    else
      return new Padding(
        padding: padding is! EdgeInsetsGeometry
            ? EdgeInsets.all(padding.toDouble())
            : padding,
        child: _child,
      );
  }
}

class VerticalLayout extends DirectionalLayout {
  VerticalLayout({
    this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.flex = false,
    this.padding,
  }) : super(
          children: children,
          direction: Axis.vertical,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          padding: padding,
        );

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool flex;
  final dynamic padding;
}

class HorizontalLayout extends DirectionalLayout {
  HorizontalLayout({
    this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.flex = false,
    this.padding,
  }) : super(
          children: children,
          direction: Axis.horizontal,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          flex: flex,
          padding: padding,
        );

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool flex;
  final dynamic padding;
}

class SetFlex extends StatelessWidget {
  SetFlex({this.child, this.flex = 1, this.padding});
  final Widget child;
  final int flex;
  final dynamic padding;

  @override
  Widget build(BuildContext context) {
    if (padding == null || padding == 0)
      return child;
    else
      return new Padding(
        padding: padding is! EdgeInsetsGeometry
            ? EdgeInsets.all(padding.toDouble())
            : padding,
        child: child,
      );
  }
}

class Shrink extends DirectionalLayout {
  Shrink({
    this.child,
    this.direction,
    this.padding,
  }) : super(
          children: <Widget>[child],
          direction: direction,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: padding,
        );

  final Widget child;
  final Axis direction;
  final dynamic padding;
}

class VerticalShrink extends Shrink {
  VerticalShrink({this.child, this.padding})
      : super(child: child, padding: padding, direction: Axis.vertical);
  final Widget child;
  final dynamic padding;
}

class HorizontalShrink extends Shrink {
  HorizontalShrink({this.child, this.padding})
      : super(child: child, padding: padding, direction: Axis.horizontal);
  final Widget child;
  final dynamic padding;
}
