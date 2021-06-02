import 'package:arm_test/src/services/firestore_service.dart';
import 'package:flutter/material.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({required this.user, required this.post});

  final User user;
  final Post post;

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  User user = User.empty();
  Post post = Post.empty();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = widget.user;
    post = widget.post;
    titleController.text = post.title;
    descriptionController.text = post.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await FirestoreDB.deletePost(post);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                vertSpace(height: 150),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                vertSpace(height: 20),
                vertSpace(height: 20),
                ElevatedButton(
                  child: Text('Update post'),
                  onPressed: () async {
                    final newPost = post.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                    );

                    await FirestoreDB.updatePost(newPost);
                    Navigator.pop(context);
                  },
                ),
                vertSpace(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget vertSpace({double height = 10}) {
  return SizedBox(
    height: height,
  );
}
