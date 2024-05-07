import 'package:flutter/material.dart';

class CustomBodyTempalte extends StatefulWidget {
  List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  CustomBodyTempalte({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.children = const <Widget>[],
    super.key,
  });

  @override
  State<CustomBodyTempalte> createState() => _CustomBodyTempalteState();
}

class _CustomBodyTempalteState extends State<CustomBodyTempalte> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children,
      ),
    );
  }
}
