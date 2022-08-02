import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class PrimaryScaffoldWidget extends StatefulWidget {
  final Widget body;

  const PrimaryScaffoldWidget({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryScaffoldWidget> createState() => _PrimaryScaffoldWidgetState();
}

class _PrimaryScaffoldWidgetState extends State<PrimaryScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black.getColor,
        body: widget.body,
      ),
    );
  }
}
