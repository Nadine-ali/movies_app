import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/items/popular_item.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom:10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("popular now",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder(future: api_manager.getPopular(),
                builder:(context, snapshot) {
               if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
                }
               if(snapshot.hasError){
               Text("something went wrong");
               }
               if(snapshot.data?.results==null){
                 return Center(
                 child: Text(snapshot.data?.status_message??"errorrrrr",
                 style: TextStyle(color: Colors.white),),
                 );
                }
               var popularList=snapshot.data?.results??[];
              return SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                    itemCount: popularList.length,
                    itemBuilder:(context, index, realIndex) {
                     return popular_item(popularList,index);
                    },
                    options:CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      autoPlayAnimationDuration: Duration(seconds: 3)
                    )),
              );

            }
            ),

          ],
        ),
      ),
    ) ;
  }
}
