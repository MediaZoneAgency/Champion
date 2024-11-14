// import 'package:education/feature/profile/ui/widget/wish_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../logic/profile_cubit.dart';
//
// class WishListGridView extends StatelessWidget {
//   const WishListGridView({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 4.0,
//                   childAspectRatio: 0.5,
//                   mainAxisExtent: 275,
//                 ),
//                 itemCount: ProfileCubit.get(context).wishList.length,
//                 itemBuilder: (context, index) {
//                   return WishListItem(
//                     wishListModel: ProfileCubit.get(context).wishList[index],
//                     onTap1: () {
//                       // Navigator.pushNamed(context, Routes.categoryDetails,
//                       //     arguments: HomeCubit.get(context).products[index]);
//                     }, // Implement your onTap logic here
//                   );
//                 },
//               );
//       },
//     );
//   }
// }
