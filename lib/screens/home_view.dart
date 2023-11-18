import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/items/TopRated_item.dart';
import 'package:movies_app/items/nowplaying_item.dart';
import 'package:movies_app/items/popular_item.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:0,left: 20,right: 20,bottom:10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Popular Now",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color:Color(0xffce890a),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                                  enlargeCenterPage: true,
                                  pageSnapping: true,
                                  clipBehavior: Clip.antiAlias,
                                  autoPlayAnimationDuration: Duration(seconds:1)
                              )),
                        );

                      }
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Now Playing",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color:Color(0xffce890a),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder(future: api_manager.getNowPlaying(),
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
                        var nowPlayingList=snapshot.data?.results??[];
                        return Container(
                          height: 300,
                          child:ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:nowPlayingList.length ,
                                  itemBuilder:(context, index) {
                                    return nowplaying_item(nowPlayingList, index);
                                  },
                              )
                        );

                      }
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Rated",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color:Color(0xffce890a),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder(future: api_manager.getTopRated(),
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
                        var topRatedList=snapshot.data?.results??[];
                        return Container(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topRatedList.length,
                            itemBuilder:(context, index) {
                            return topRated_item(topRatedList, index);
                          },),
                        );

                      }
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ) ;
  }
}
