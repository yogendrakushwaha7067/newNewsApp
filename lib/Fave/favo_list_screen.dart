

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newapptaskbang/News/news_controller.dart';
import 'package:newapptaskbang/Utilis/ReusableWidget/reusable_image_with_shimmer.dart';

import '../details_screen.dart';

class FavoScreen extends GetView<NewsController> {
  static const String routeName = "/favo";
//h
  const FavoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          Expanded(
              child: Obx(
                      () {
                    return
                      controller.listFav.isEmpty?const Center(child: Text("No Data Found"),): ListView.builder(
                        itemCount:controller.listFav.length ,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Get.toNamed(DetailsScreen.routeName,arguments: [controller.listFav[index]]);
                            },
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                Dismissible(
                                    background: const SizedBox.shrink(),
                                    onDismissed: (value){
                                      controller.addToFavorites(index);
                                    },

                                    direction: DismissDirection.endToStart,
                                    secondaryBackground: Container(

                                      decoration: const BoxDecoration(
                                          color: Color(0xffFCD1D1)
                                      ),
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite,color: Color(0xffFA6464),size: 27,),
                                          Text("Add To Favorite",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),)
                                        ],
                                      ),
                                    ),
                                    key: Key(index.toString()), child:Row(children: [
                                  Expanded(
                                      flex:1,
                                      child: ReusableImageWithShimmer(url: "${controller.newsModel.value.articles?[index].urlToImage}", height: 100,boxFit: BoxFit.cover,isCircle: false,borderRadius: 6,)),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    flex:2,
                                    child: Column(

                                      children: [
                                        Text("${controller.newsModel.value.articles?[index].title}",style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),maxLines: 2,),
                                        const SizedBox(height: 2,),
                                        Text("${controller.newsModel.value.articles?[index].description}",style: const TextStyle(color: Color(0xff212121),fontSize: 15,fontWeight: FontWeight.w400),maxLines: 2,)
                                        ,const SizedBox(height: 2,),

                                        Row(
                                          children: [
                                            const Icon(Icons.date_range,color: Color(0xff707070),),
                                            Text("${controller.newsModel.value.articles?[index].publishedAt}",style: const TextStyle(color: Color(0xff707070),fontSize: 15,fontWeight: FontWeight.w400),maxLines: 2,)


                                          ],
                                        )




                                      ],
                                    ),
                                  )






                                ],)),
                              ),
                            ),
                          );
                        });
                  }
              )
          )
        ],
      ),
    );
  }
}
