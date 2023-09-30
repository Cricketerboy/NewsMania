import 'package:flutter/material.dart';
import 'package:newsapp/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsCnt,
      required this.newsDesc,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/images/Breakingnewz.jpg",
            image: imgUrl,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                    newsHead.length > 90
                        ? "${newsHead.substring(0, 90)}..."
                        : newsHead,
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Text(newsDesc,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    newsCnt != "--"
                        ? newsCnt.length > 250
                            ? newsCnt.substring(0, 250)
                            : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                        : newsCnt,
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailViewScreen(
                                  newsUrl: newsUrl,
                                )));
                  },
                  child: Text("Read More"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
