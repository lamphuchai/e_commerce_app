import 'dart:developer';

import 'package:e_commerce_app/views/auth/login/login.dart';
import 'package:e_commerce_app/views/auth/sign_up/sign_up.dart';
import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:e_commerce_app/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:e_commerce_app/views/product/product.dart';
import 'package:e_commerce_app/views/shop/shop.dart';
import 'package:e_commerce_app/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    log(settings.name.toString());
    switch (settings.name) {
      case "/":
        return PageTransition(
            child: const SplashPage(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/sign_up":
        return PageTransition(
            child: const SignUpView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/login":
        return PageTransition(
            child: const LoginView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/bottom_nav_bav":
        return PageTransition(
            child: const BottomNavBarView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "filter_view":
        return PageTransition(
            child: const FiltersView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "product/product_detail":
        return PageTransition(
            child: const ProductDetailView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "product/rating_and_reviews":
        return PageTransition(
            child: const RatingAndReviewsView(),
            type: PageTransitionType.rightToLeftWithFade);

      case "/bag/checkout":
        return PageTransition(
            child: const CheckoutView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/bag/checkout/shippingAddressView":
        return PageTransition(
            child: const ShippingAddressView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/bag/checkout/addShippingAddress":
        return PageTransition(
            child: const AddShippingAddressView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/bag/checkout/payment":
        return PageTransition(
            child: const PaymentView(),
            type: PageTransitionType.rightToLeftWithFade);
      case "/bag/checkout/success":
        return PageTransition(
            child: const SuccessBagPage(),
            type: PageTransitionType.rightToLeftWithFade);

      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text("no route"),
              ),
            ));
  }
}
