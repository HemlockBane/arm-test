import 'package:arm_test/src/services/firestore_service.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  static final String routeName = 'new_post';
  const NewPostScreen({required this.user});

  final User user;

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  User user = User.empty();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = widget.user;
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                  child: Text('Post'),
                  onPressed: () async {
                    final post = Post(
                      title: titleController.text,
                      description: descriptionController.text,
                    );

                    await FirestoreDB.addPost(post);
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
