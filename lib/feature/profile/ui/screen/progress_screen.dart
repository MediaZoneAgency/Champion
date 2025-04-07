// lib/progress_screen.dart (أو المسار الذي اخترته)

import 'package:flutter/material.dart';

// Enum لتمثيل حالة الدورة بوضوح
enum CourseStatus { completed, inProgress, notStarted }

// موديل لبيانات الدورة (استبدله بالموديل الفعلي الخاص بك)
class EnrolledCourse {
  final String title;
  final String description;
  final CourseStatus status;

  EnrolledCourse({
    required this.title,
    required this.description,
    required this.status,
  });
}

class ProgressScreen extends StatelessWidget {
  ProgressScreen({super.key});

  // --- بيانات مؤقتة (استبدلها ببياناتك الفعلية) ---
  final String studentName = "Carin Osama";
  final String grade = "5";
  final String overallProgress = "75%";
  final String profileImageUrl =
      'https://via.placeholder.com/150'; // استبدل بالرابط الفعلي أو مسار الملف

  final List<EnrolledCourse> enrolledCourses = [
    EnrolledCourse(
      title: "Mathematics",
      description: "All videos completed",
      status: CourseStatus.completed,
    ),
    EnrolledCourse(
      title: "Science",
      description: "2 videos remaining",
      status: CourseStatus.inProgress,
    ),
    EnrolledCourse(
      title: "History",
      description: "Not started",
      status: CourseStatus.notStarted,
    ),
    // أضف المزيد من الدورات حسب الحاجة
  ];
  // --- نهاية البيانات المؤقتة ---

  Widget _buildStatusIcon(CourseStatus status) {
    switch (status) {
      case CourseStatus.completed:
        return const Icon(Icons.check_circle, color: Colors.green, size: 28);
      case CourseStatus.inProgress:
        // استخدام أيقونة مخطط دائري كعنصر نائب للدائرة الجزئية
        return const Icon(Icons.pie_chart, color: Colors.orange, size: 28);
        // بدائل أخرى: Icons.timelapse أو Icons.data_usage
      case CourseStatus.notStarted:
        return const Icon(Icons.check_box_outline_blank, color: Colors.grey, size: 28);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // إزالة الظل
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            // التعامل مع الرجوع للخلف
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Progress',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // استخدام SingleChildScrollView إذا كان المحتوى قد يتجاوز ارتفاع الشاشة
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- قسم الملف الشخصي ---
              CircleAvatar(
                radius: 50,
                // استخدام NetworkImage للروابط أو AssetImage للملفات المحلية
                backgroundImage: NetworkImage(profileImageUrl),
                // أو: backgroundImage: AssetImage('assets/your_image.png'),
                backgroundColor: Colors.grey[200], // خلفية مؤقتة
              ),
              const SizedBox(height: 15),
              Text(
                studentName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Grade: $grade',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$overallProgress Overall Progress',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),

              // --- شريط البحث ---
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Courses',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  suffixIcon: Icon(Icons.filter_list, color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.grey[100], // خلفية فاتحة للبحث
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none, // بدون خط حدود
                  ),
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12.0),
                     borderSide: BorderSide.none,
                  ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12.0),
                     borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0), // اختياري: تمييز الحدود عند التركيز
                  ),
                ),
                onChanged: (value) {
                  // التعامل مع منطق البحث
                },
              ),
              const SizedBox(height: 30),

              // --- قسم الدورات المسجلة ---
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enrolled Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent, // أو لونك الأحمر المحدد
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // --- قائمة الدورات ---
              ListView.separated(
                shrinkWrap: true, // هام داخل SingleChildScrollView
                physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير الخاص بـ ListView
                itemCount: enrolledCourses.length,
                itemBuilder: (context, index) {
                  final course = enrolledCourses[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero, // إزالة الحشو الافتراضي لـ ListTile
                    leading: _buildStatusIcon(course.status),
                    title: Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500, // وزن متوسط
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      course.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    onTap: () {
                      // التعامل مع النقر على عنصر دورة
                      print('Tapped on ${course.title}');
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 20, // مسافة تتضمن خط الفاصل
                  thickness: 1,
                  color: Color.fromARGB(255, 236, 236, 236), // فاصل فاتح
                ),
              ),
               const SizedBox(height: 20), // إضافة بعض الحشو في الأسفل
            ],
          ),
        ),
      ),
    );
  }
}