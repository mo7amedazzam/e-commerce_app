import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'shop/cubit/states.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/ui/login/login_screen/login_screen.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'constans/const.dart';
import 'package:flutter/material.dart';
import 'helper/dio_helper.dart';
import 'onBoarding_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  DioHelper.init();
  await SpHelper.init();
  bool isDark = SpHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = SpHelper.getData(key: 'onBoarding');
  token = SpHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null)
  {
    if (token != null)
      widget = ShopWidget();
    else
      widget = ShopLoginScreen();
  } else
    {
    widget = OnBoardingScreen();
    }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getHomoeData()..getCategories()..getFavorites()..getUserData(),
        // ..changeAppMode(
        //   fromShared: isDark,
        // ),
      child: BlocConsumer<ShopCubit, ShopeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            routes: {
            ShopWidget.routeName: (context) =>ShopWidget(),
            HomePage.routeName: (context) =>HomePage(),
            },
            debugShowCheckedModeBanner: false,
            home: startWidget,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ShopCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
