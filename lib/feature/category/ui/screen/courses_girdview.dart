import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'category_girdaview.dart';

class CoursesGirdview extends StatefulWidget {
  CoursesGirdview( this.label,{super.key} );
final String? label;

  @override
  State<CoursesGirdview> createState() => _CoursesGirdviewState();
}

class _CoursesGirdviewState extends State<CoursesGirdview> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text(widget.label??"Courses"),
          ),
          body: CourseGridView(widget.label),
        );

  }
}
