import 'package:education/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../home/logic/home_cubit.dart';

import '../../data/topic_model.dart';

class CourseSections extends StatefulWidget {
 final int course_id;

  const CourseSections({super.key, required this.course_id});
  @override
  State<CourseSections> createState() => _CourseSectionsState();
}


class _CourseSectionsState extends State<CourseSections> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeCubit.get(context).getTopic(widget.course_id);

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);

        if (state is FetchTopicLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is FetchTopicFailure) {
          return Center(child: Text("خطأ في تحميل البيانات: ${state.errorMessage}"));
        }

        // **جلب المواضيع بشكل صحيح**
        final List<TopicData> topics = HomeCubit.get(context).Topics.cast<TopicData>();

        if (topics.isEmpty) {
          return Center(child: Text("لا توجد مواضيع متاحة."));
        }

        return Container(
          decoration: BoxDecoration(
            color: ThemeCubit.get(context).themeMode == ThemeMode.light
                ? ColorsManager.primaryBlueLight
                : Color(0xFF343A40),
          ),
          child: ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index]; // **الوصول إلى عنصر معين داخل القائمة**

              return ExpansionTile(
                title: Text(
                  topic.postTitle ?? "بدون عنوان", // **العنوان من `TopicData`**
                  style: ThemeCubit.get(context).themeMode == ThemeMode.light
                      ? TextStyles.poppinsRegular16blue
                      : TextStyles.poppinsRegular16blue,
                ),
                children: [
                  ListTile(
                    title: Text(
                      topic.postContent ?? "لا يوجد محتوى متاح", // **الوصول إلى `postContent` بشكل صحيح**
                      style: ThemeCubit.get(context).themeMode == ThemeMode.light
                          ? TextStyles.poppinsRegular16blue.copyWith(color: Colors.black)
                          : TextStyles.poppinsRegular16blue.copyWith(color: Colors.white),
                    ),
                    subtitle: Text("مدة الفيديو - 1:39"), // يمكنك تحديث هذه القيمة ديناميكيًا
                    trailing: SvgPicture.asset('assets/img/video-square.svg'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
