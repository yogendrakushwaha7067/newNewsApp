
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapptaskbang/News/news_model.dart';
import 'package:newapptaskbang/Utilis/ReusableWidget/reusable_image_with_shimmer.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";



  @override
  Widget build(BuildContext context) {
    var data=Get.arguments[0];
    return Scaffold(
      appBar: AppBar(leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
          child: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,)),
      title: const Text("Back",style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableImageWithShimmer(url: "${data?.urlToImage}", height: MediaQuery.of(context).size.height*0.4,isCircle: false,borderRadius: 6,boxFit: BoxFit.cover,width: double.infinity,)
         ,
          const SizedBox(height: 5,),
          Text("${data?.title}",style: const TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
          Row(
            children: [
              const Icon(Icons.date_range,color: Color(0xff707070),),const SizedBox(width: 5,)
              ,Text("${data?.publishedAt}",style: const TextStyle(color: Color(0xff707070),fontSize: 15,fontWeight: FontWeight.w400),maxLines: 2,),
            ],
          )
         , const SizedBox(height: 10,),
          Text("${data?.description}",style: const TextStyle(color: Color(0xff707070),fontSize: 15,fontWeight: FontWeight.w400),)

        ],
      ),
    );
  }
}
