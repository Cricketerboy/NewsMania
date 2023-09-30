class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  String newsCnt;

  NewsArt({
   required this.imgUrl,
   required this.newsHead,
   required this.newsDesc,
   required this.newsUrl,
   required this.newsCnt,
  });

 static NewsArt fromApitoApp(Map<String,dynamic> article) {

    return NewsArt(
    imgUrl:article["urlToImage"] ?? "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    newsCnt: article["content"] ?? "--",
    newsDesc: article["description"] ?? "--",
    newsUrl : article["url"] ?? "https://www.news18.com/tech/xiaomi-confirms-these-smartphones-will-get-5g-support-in-india-all-details-7751749.html",
    newsHead: article["title"] ?? "--",
    );

  }
}