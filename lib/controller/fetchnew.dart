//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=b303432d3de342ddbd0e33159492d219

import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'package:newsapp/model/newsArt.dart';

class FetchNews{
  static List sourcesId = [
    "abc-news",
 
    "bbc-news",
    "bbc-sport",

    "business-insider",

    "entertainment-weekly",
    "financial-post",
   
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",
    
    "national-geographic",
 
    "news24",
    "new-scientist",
   
    "new-york-magazine",
    "next-big-future",
  
    "techcrunch",
    "techradar",
   
    "the-hindu",
   
    "the-wall-street-journal",
    
    "the-washington-times",
    "time",
    "usa-today",
    
  ];
  static Future<NewsArt> fetchNews() async{

    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);
    
    
    Response response = await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=b303432d3de342ddbd0e33159492d219"));
   
   Map body_data = jsonDecode(response.body);
   List articles = body_data["articles"];
   //print(articles);

   final _newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];
    // print(myArticle);
    
    return NewsArt.fromApitoApp(myArticle);
  }
}