import 'package:e_commerce_app/bloc/authentication/authentication.dart';
import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:e_commerce_app/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:e_commerce_app/views/favorites/favorites.dart';
import 'package:e_commerce_app/views/home/home.dart';
import 'package:e_commerce_app/views/profile/profile.dart';
import 'package:e_commerce_app/views/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexPage =
        context.select((NavigationBarCubit cubit) => cubit.state.indexPage);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: IndexedStack(index: indexPage, children: [
          const HomeView(),
          Navigator(
            onGenerateRoute: (settings) {
              if (settings.name == "/show/catalog") {
                return PageTransition(
                    child: const CatalogView(),
                    type: PageTransitionType.rightToLeftWithFade);
              }
              return MaterialPageRoute(builder: (_) => const CategoriesView());
            },
          ),
          const MyBagView(),
          const FavoritesView(),
          const MyProfilePage()
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildBottom(indexPage, context),
      ),
    );
  }

  Container _buildBottom(int indexPage, BuildContext context) {
    return Container(
      color: Colors.white,
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildItemNavBar(
              isPage: indexPage == 0 ? true : false,
              label: "Home",
              index: 0,
              context: context),
          _buildItemNavBar(
              isPage: indexPage == 1 ? true : false,
              label: "Shop",
              index: 1,
              context: context),
          _buildItemNavBar(
              isPage: indexPage == 2 ? true : false,
              label: "Bag",
              index: 2,
              context: context),
          _buildItemNavBar(
              isPage: indexPage == 3 ? true : false,
              label: "Favorites",
              index: 3,
              context: context),
          _buildItemNavBar(
              isPage: indexPage == 4 ? true : false,
              label: "Profile",
              index: 4,
              context: context),
        ],
      ),
    );
  }

  Widget _buildItemNavBar(
      {required bool isPage,
      required String label,
      required int index,
      required BuildContext context}) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () => context.read<NavigationBarCubit>().setIndexPage(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (label == "Home") ...[
                Image.asset(
                  isPage ? AppIcon.seHome : AppIcon.unHome,
                  width: 30,
                  height: 30,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: isPage ? Colors.red : const Color(0xff9B9B9B)),
                )
              ],
              if (label == "Shop") ...[
                Image.asset(
                  isPage ? AppIcon.seShop : AppIcon.unShop,
                  width: 30,
                  height: 30,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: isPage ? Colors.red : const Color(0xff9B9B9B)),
                )
              ],
              if (label == "Bag") ...[
                Image.asset(
                  isPage ? AppIcon.seBag : AppIcon.unBag,
                  width: 30,
                  height: 30,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: isPage ? Colors.red : const Color(0xff9B9B9B)),
                )
              ],
              if (label == "Favorites") ...[
                Image.asset(
                  isPage ? AppIcon.seHeart : AppIcon.unHeart,
                  width: 30,
                  height: 30,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: isPage ? Colors.red : const Color(0xff9B9B9B)),
                )
              ],
              if (label == "Profile") ...[
                Image.asset(
                  isPage ? AppIcon.seProfile : AppIcon.unProfile,
                  width: 30,
                  height: 30,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: isPage ? Colors.red : const Color(0xff9B9B9B)),
                )
              ],
            ],
          ),
        ));
  }
}
