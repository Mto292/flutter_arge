import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
class Shimmer extends StatefulWidget {
  @override
  _Shimmer createState() => _Shimmer();
}

class _Shimmer extends State<Shimmer> {

   double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFShimmer(child:CarouselShimmer(context),),
            SizedBox(height: 12,),
            GFShimmer(
              child: emptyBlock(double.infinity,MediaQuery.of(context).size.width * 0.5,MediaQuery.of(context).size.width * 0.25),
            ),
            SizedBox(height: 12,),
            GFShimmer(
              child: emptyBlock(MediaQuery.of(context).size.width * 0.5  ,MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.width * 0.10),
            ),
            SizedBox(height: 12,),

            GFShimmer(
              child: emptyBlock(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.width * 0.10,MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(height: 12,),
            GFShimmer(
              child: emptyBlock(0.0,0.0,0.0),
            ),
          ],
        ),
      ),
    );
  }

  emptyBlock(width1,width2,width3) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 46,
          color: Colors.white,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: width1,
                height: 8,
                color: Colors.white,
              ),
              const SizedBox(height: 6),
              Container(
                width:   width2,
                height: 8,
                color: Colors.white,
              ),
              const SizedBox(height: 6),
              Container(
                width:  width3,
                height: 8,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    ),
  );}

  CarouselShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        color: Colors.white,
      ),
    );
  }


}
