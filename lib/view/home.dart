import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchnew.dart';
import 'package:newsapp/model/newsArt.dart';
import 'package:newsapp/view/widgets/NewsCon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   bool isloading = true;
   late NewsArt newsArt;
   GetNews() async{
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isloading = false;
    });
   }

  @override
  void initState() {
    // TODO: implement initState
    GetNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0),
        onPageChanged: (value) {
          setState(() {
            isloading = true;
          });
          GetNews();
        },
        itemBuilder: (context, index) {
          return isloading ? Center(child: CircularProgressIndicator(),):NewsContainer(
          imgUrl: newsArt.imgUrl,
          newsHead: newsArt.newsHead,
          newsCnt: newsArt.newsCnt,
          newsUrl:newsArt.newsUrl,
          newsDesc: newsArt.newsDesc,
        );
        },
      ),
    );
  }
}