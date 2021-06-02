import 'package:arm_test/src/screens/new_post.dart';
import 'package:arm_test/src/services/article_service.dart';
import 'package:arm_test/src/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'edit_post.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen();

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Article>>(
        future: ArticleService.getArticles(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text("Loading");
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final article = snapshot.data?[index];

              return Text("aa");
            },
          );
        },
      ),
    );
  }
}
