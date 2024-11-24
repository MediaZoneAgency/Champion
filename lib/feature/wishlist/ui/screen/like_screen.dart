import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:education/feature/wishlist/ui/widget/ui_loading_wishlist.dart';
import 'package:education/feature/wishlist/ui/widget/wishlist_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../cart/ui/widget/cart_bar.dart';
import '../../../cart/ui/widget/cart_widget.dart';

import '../widget/wishlist_list_view.dart';

class WishListScreen extends StatefulWidget{
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();

    FavCubit.get(context).getWishList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

          children: [
            WishlistBar(username: 'WishList'),
            BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (state  is GetWishListLoading) {
                  return const Skeletonizer(
                    enabled: true,
                    child: UiLoadingWishlist(),
                  );
                }
                if (FavCubit.get(context).wishList.isNotEmpty) {
                  return    Expanded(child: WishListView());
                }
                return Container();

              },
            ),


        ],
      ),

    );
  }
}
