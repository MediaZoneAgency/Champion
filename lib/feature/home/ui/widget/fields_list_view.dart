import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'field_circle.dart';

class CategoryListView extends StatelessWidget {
  // final List<Map<String, dynamic>> categories = [
  //   {'icon': Icons.design_services, 'label': HomeCubit.get(context).categoryModel.},
  //   {'icon': Icons.code, 'label': 'Programming'},
  //   {'icon': Icons.business_center, 'label': 'Business'},
  //   {'icon': Icons.more_horiz, 'label': 'More'},
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeCubit.get(context).categoryModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CategoryItem(
                  icon:HomeCubit.get(context).categoryModel[index].image!=null ?  HomeCubit.get(context).categoryModel[index].image!.src! :"https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg" ,
                  label: HomeCubit.get(context).categoryModel[index].name!,
                ),
              );
            },
          ),
        );
      },
    );
  }
}