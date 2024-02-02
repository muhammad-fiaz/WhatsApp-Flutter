import 'package:flutter/material.dart';

class CGSendImageToPersonScreen extends StatefulWidget {
  @override
  _CGSendImageToPersonScreenState createState() => _CGSendImageToPersonScreenState();
}

class _CGSendImageToPersonScreenState extends State<CGSendImageToPersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
        ),
        backgroundColor: Colors.black12,
        body: const Stack(
          children: [
            // ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: widget.images.length,
            //     itemBuilder: (context, index) {
            //       Asset asset = widget.images[index];
            //       return Container(
            //         width: MediaQuery.of(context).size.width * 0.8,
            //         height: MediaQuery.of(context).size.height*0.8,
            //         child: AssetThumb(
            //           asset: asset,
            //           width: 300,
            //           height: 300,
            //         ),
            //       );
            //     })
            //   GridView.count(
            //     // scrollDirection: Axis.horizontal,
            //   physics: PageScrollPhysics(),
            //   crossAxisCount: 3,
            //   children: List.generate(widget.images.length, (index) {
            //     Asset asset = widget.images[index];
            //     return AssetThumb(
            //       asset: asset,
            //       width: 300,
            //       height: 300,
            //     );
            //   }),
            // ),
            /*PageView.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  widget.asset = widget.images[index];
                  print(widget.asset);
                  return AssetThumb(
                    asset: widget.asset,
                    height: 50,
                    width: 50,
                  );
                }),
            Positioned(
              bottom: 0,
              child: Container(
                width: 500,
                height: 100,
                color: Colors.black12,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.bottomRight,
                        height: 30,
                        width: 50,
                        padding:  EdgeInsets.all(16.0),
                        child: AssetThumb(
                            asset: widget.asset, width: 50, height: 50),
                      );
                    }),
              ),
            )*/
          ],
        ));
  }
}
