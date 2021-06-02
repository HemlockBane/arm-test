import 'package:arm_test/src/screens/new_post.dart';
import 'package:arm_test/src/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'edit_post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({required this.user});

  final User user;

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  User user = User.empty();
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NewPostScreen(
              user: user,
            );
          }));
        },
        child: Icon(Icons.post_add_sharp),
      ),
      body: StreamBuilder(
        stream:
            postsCollection.where("email", isEqualTo: user.email).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (!snapshot.hasData) return Text("Loading");

          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot docSnapshot = snapshot.data!.docs[index];
              final post = Post.fromDocSnapshot(docSnapshot);

              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EditPostScreen(
                      user: user,
                      post: post,
                    );
                  }));
                },
              );
            },
          );
        },
      ),
    );
  }
}
