import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference usersCollection = _firestore.collection('users');
final CollectionReference postsCollection = _firestore.collection('posts');

class FirestoreDB {
  static Future<void> register({required Map<String, String> data}) async {
    try {
      final ref = usersCollection.doc(data["email"]);
      await ref.set(data);
    } catch (e) {
      throw (e);
    }
  }

  static Future<User> login(String email, String password) async {
    final ref = usersCollection.doc(email);
    final doc = await ref.get();
    User user = User.empty();

    if (doc.exists) {
      user = User.fromDocSnapshot(doc);
    }
    return user;
  }

  static Future<void> addPost(Post post) async {
    final docRef = await postsCollection.add(post.toJson());
  }
}

class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User(
      {this.firstName = '',
      this.lastName = "",
      this.email = "",
      this.password = ""});

  User.empty() : this();

  bool get isValid =>
      this.firstName.isNotEmpty &&
      this.lastName.isNotEmpty &&
      this.email.isNotEmpty &&
      this.password.isNotEmpty;

  factory User.fromDocSnapshot(DocumentSnapshot doc) {
    return User(
      firstName: doc["firstname"],
      lastName: doc["lastname"],
      email: doc["email"],
      password: doc["password"],
    );
  }

  @override
  String toString() {
    return ''
        // 'id - $id, '
        'firstname - $firstName, '
        'lastname - $lastName, '
        'email - $email, '
        'password - $password, ';
  }
}

class Post {
  String title;
  String description;
  String imageUrl;
  String email;

  Post(
      {this.title = '',
      this.description = "",
      this.imageUrl = "",
      this.email = ""});

  Post.empty() : this();

  // bool get isValid =>
  //     this.firstName.isNotEmpty &&
  //     this.lastName.isNotEmpty &&
  //     this.email.isNotEmpty &&
  //     this.password.isNotEmpty;

  factory Post.fromDocSnapshot(QueryDocumentSnapshot doc) {
    return Post(
      title: doc["title"],
      email: doc["email"],
      description: doc["description"],
      imageUrl: doc["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['title'] = title;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }

  @override
  String toString() {
    return ''
        'title - $title, '
        'description - $description, '
        'imageUrl - $imageUrl, ';
  }
}
