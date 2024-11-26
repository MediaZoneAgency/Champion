import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'category_girdaview.dart';

class CoursesGirdview extends StatelessWidget {
  CoursesGirdview({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text('Courses'),
          ),
          body: CourseGridView(),
        );

  }
}
