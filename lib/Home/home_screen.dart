

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newapptaskbang/Home/home_controller.dart';

import '../News/news_list_screen.dart';

class HomeScreen extends GetView<HomeController> {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),

      appBar: AppBar(
        backgroundColor: Colors.white,

        title:  Row(
          children: [
            Obx(
                    () {
                  return Expanded(
                    child: InkWell(
                      onTap: (){
                        controller.selectIndex.value=0;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                        decoration:  BoxDecoration(
                            color: controller.selectIndex.value==0? const Color(0xffEEF3FD):Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.menu,color: Color(0xff212121),size: 33,),
                            Text("News",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),)
                          ],),

                      ),
                    ),


                  );
                }
            ),
            const SizedBox(width: 10,),
            Obx(
                    () {
                  return Expanded(
                    child: InkWell(
                      onTap: (){
                        controller.selectIndex.value=1;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                        decoration:  BoxDecoration(
                            color:controller.selectIndex.value==1? const Color(0xffEEF3FD):Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.favorite,color: Color(0xffFA6464),size: 33,),
                            Text("Favs",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),)
                          ],),

                      ),
                    ),


                  );
                }
            ),
          ],
        ),
      ),
      body: Obx(
              () {
            return  controller.listPage[ controller.selectIndex.value];
          }
      ),

    );
  }
}
