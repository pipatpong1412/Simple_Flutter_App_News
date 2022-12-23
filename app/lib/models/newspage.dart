import 'dart:convert';

import 'package:app/models/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  
  List<Articles> news = [];

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Today'),
        backgroundColor: Colors.green,
      ),
      body: 
          ListView.separated(itemBuilder: ((context, index) {
            return ListTile(
              leading: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(image: NetworkImage('${news[index].urlToImage}'))
                ),
              ),
              title: Text('${news[index].title}'),
              subtitle: Text('${news[index].description}'),
              onTap: () async{
                
              },
            );
          }), separatorBuilder: ((context, index) => const Divider()), itemCount: news.length)
    );
  }

  _getNews() async {
    var newsparam = {
      'country': 'th',
      'apiKey': 'your apiKey'
    };
    var newsurl = Uri.https('newsapi.org','/v2/top-headlines', newsparam);
    
    final res = await http.get(newsurl); 
    if (res.statusCode == 200) {
      NewsModel news_data = NewsModel.fromJson(jsonDecode(res.body));
      setState(() {
        news = news_data.articles!;
      });
    }

  }
}
