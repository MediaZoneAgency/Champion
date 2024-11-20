import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:education/feature/wishlist/ui/widget/wishlist_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/ui/widget/cart_bar.dart';
import '../../../cart/ui/widget/cart_widget.dart';
import '../../../home/logic/product_cubit.dart';
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
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return const Scaffold(

          body: Column(

              children: [
              WishlistBar(username: 'WishList'),
                Expanded(child: WishListView()),
            ],
          ),

        );
      },
    );
  }
}
