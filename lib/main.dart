import 'package:e_commerce_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/utils/router/app_router.dart';
import 'package:e_commerce_app/views/auth/login/login.dart';
import 'package:e_commerce_app/views/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  BlocOverrides.runZoned(() => runApp(const App()),
      blocObserver: AppBlocObserver());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationBloc()..add(const AuthenticationInit()),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false,physics:const ClampingScrollPhysics()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: "/",
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: const Color(0xffF9F9F9),
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xffF9F9F9),
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.black)),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                color: Colors.black, fontSize: 34, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(color: Color(0xff9B9B9B), fontSize: 11),
            bodySmall: TextStyle(color: Color(0xff9B9B9B), fontSize: 10),
          )),
      // onGenerateRoute: ,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
