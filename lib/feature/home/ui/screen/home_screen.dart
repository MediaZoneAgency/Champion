
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/ad_container.dart';
import '../widget/fields_list_view.dart';
import '../widget/home_bar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeBar(username: 'Sarah',),
                const SizedBox(height: 15,),
                const AdContainer(),
                CategoryListView(),
              ],
            ),
          ),


        ],

      ),
    );
  }
}