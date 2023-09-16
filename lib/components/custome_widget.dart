
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidgets{
  static Widget shimmer(double width, {Color color= Colors.grey,bool singleShimmer = false, double heightScale=1}){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(15*heightScale),
            child: !singleShimmer?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height:80,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Container(
                        width: 150*heightScale,
                        height:25*heightScale,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 200*heightScale,
                        height:25*heightScale,
                        color: Colors.black,
                      ),
                    ],)
                  ],
                ),

              ],
            ):Container(
              width: double.infinity,
              height:15*heightScale,
              color: Colors.black,
            ),
          ),
        )
    );
  }

  static Widget shimmer1(double width, {Color color= Colors.grey,bool singleShimmer = false, double heightScale=1}){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(15*heightScale),
            child: !singleShimmer?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: 80,
                    //   height:80,
                    //   color: Colors.black,
                    // ),
                    // SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Container(
                        width: 150*heightScale,
                        height:25*heightScale,
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            color: color.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 200*heightScale,
                        height:25*heightScale,
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            color: color.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ],)
                  ],
                ),

              ],
            ):Container(
              width: double.infinity,
              height:15*heightScale,
              color: Colors.black,
            ),
          ),
        )
    );
  }

  static Widget singleShimmer(double width, {heightScale=1.0}){
    return CustomWidgets.shimmer(width, heightScale: heightScale, singleShimmer: true);
  }

  static Widget singleShimmer1(double width, {heightScale=1.0}){
    return CustomWidgets.shimmer(width, heightScale: heightScale, singleShimmer: true);
  }

  static Widget shimmerList(int total, {double heightScale=1, double padding=15, bool scrollable = false}){
    List<int> list = List<int>.generate(total, (i) => i + 1);
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(padding),
        physics: scrollable?BouncingScrollPhysics():NeverScrollableScrollPhysics(),
        children: list.map((t) => CustomWidgets.shimmer(double.infinity, heightScale: heightScale)).toList()
    );
  }

  static Widget shimmerList1(int total, {double heightScale=1, double padding=15, bool scrollable = false}){
    List<int> list = List<int>.generate(total, (i) => i + 1);
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(padding),
        physics: scrollable?BouncingScrollPhysics():NeverScrollableScrollPhysics(),
        children: list.map((t) => CustomWidgets.shimmer1(double.infinity, heightScale: heightScale)).toList()
    );
  }

  static Widget smoothLoading(bool show, {double size=2.0}){
    return SizedBox(
      height: show?size:0.0,
      child:
      LinearProgressIndicator()
      ,);
  }

  static dataEmpty(){
    return Container(
      alignment: Alignment.center,
      child: Text('Belum ada data :)')
      ,);
  }
}