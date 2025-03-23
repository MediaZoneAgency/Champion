import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screen/courses_grid_screen.dart';

class RewardGridView extends StatelessWidget {
  RewardGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Rewards'),
        ),
        body:CoursesGridScreen(),
      );
  }
}