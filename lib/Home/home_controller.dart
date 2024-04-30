import 'package:get/get.dart';

import '../Fave/favo_list_screen.dart';
import '../News/news_list_screen.dart';

class HomeController extends GetxController{
  RxInt selectIndex=0.obs;
  List listPage=[const NewsScreen(),const FavoScreen()];
}