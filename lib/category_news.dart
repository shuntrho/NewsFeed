import 'package:flutter/material.dart';
import 'package:news_feed/views/article_view.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/home.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/widgets/blog_tile.dart';

import 'home.dart';
import 'home.dart';

class CategoryView extends StatefulWidget {

  final String category;

  CategoryView({this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState(){
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: <Widget> [
              Text("News"),
              Text("Feed", style: TextStyle(
                  color: Colors.blue
              ),),
            ],
          )
      ),
      body: Container(
        child: Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: articles.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index){
              return BlogTile(
                article: articles[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
