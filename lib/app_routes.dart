import 'package:get/get.dart';
import 'package:newapptaskbang/Home/home_controller.dart';
import 'package:newapptaskbang/News/news_controller.dart';
import 'package:newapptaskbang/News/news_list_screen.dart';

import 'Home/home_screen.dart';
import 'details_screen.dart';





class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () =>  const HomeScreen(),
      bindings: [
        BindingsBuilder.put(() => HomeController()),
        BindingsBuilder.put(() => NewsController()),
      ],
    ),
    GetPage(
      name: NewsScreen.routeName,
      page: () =>  const NewsScreen(),
      bindings: [
        BindingsBuilder.put(() => NewsController()),
      ],
    ),
    GetPage(
      name: DetailsScreen.routeName,
      page: () =>   DetailsScreen(),
      // bindings: [
      //   BindingsBuilder.put(() => NewsController()),
      // ],
    ),




  ];
}
