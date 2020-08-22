import 'package:flutter/material.dart';

import 'package:getflutter/getflutter.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-184854340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    //https://docs.getwidget.dev/gf-carousel   bu linkten acıklamalara ulaşılabilir
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFCarousel(
              items: imageList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: FadeInImage.assetNetwork(
                            placeholder: "image/loading.gif",
                            image: url,
                            fit: BoxFit.cover,
                            width: 1000.0)),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            GFItemsCarousel(
              rowCount: 3,
              children: imageList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: FadeInImage.assetNetwork(
                            placeholder: "image/loading.gif",
                            image: url,
                            fit: BoxFit.cover,
                            width: 1000.0)),
                  );
                },
              ).toList(),
            ),
            GFCard(
              boxFit: BoxFit.cover,
              image: Image.network(
                "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
              ),
              title: GFListTile(
                  title: Text('Card Title'),
                  icon: GFIconButton(
                    onPressed: null,
                    icon: Icon(Icons.favorite_border),
                    type: GFButtonType.outline,
                  )),
              content: Text("Some quick example text to build on the card"),
              buttonBar: GFButtonBar(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    text: 'Read More',
                  ),
                ],
              ),
            ),
            GFCard(
              boxFit: BoxFit.cover,
              imageOverlay: NetworkImage(
                  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
              ),
              title: GFListTile(
                avatar: GFAvatar(child: Text("Mto"),),
                title: Text('Card Title',style: TextStyle(color: Colors.white),),
                subTitle: Text('subtitle'),
              ),
              content: Text(
                  "GFCards has three types of cards i.e, basic, with avataras and with overlay image",style: TextStyle(color: Colors.white),),
              buttonBar: GFButtonBar(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    text: 'View',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
