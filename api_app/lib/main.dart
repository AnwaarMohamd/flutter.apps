import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String baseUrl =
      'https://66cbd8fd4290b1c4f19b3a54.mockapi.io/Ecommerce/author';
  late Future<Post> postData;

  @override
  void initState() {
    super.initState();
    postData = getPostById();
  }

  Future<Post> getPostById() async {
    final response = await http.get(Uri.parse('${baseUrl}/3'));

    if (response.statusCode == 200) {
      // العملية تمت بنجاح
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('لم يتم تحميل البيانات بنجاح');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: postData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // حالة انتظار البيانات
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // حالة الخطأ
              return Text('خطأ: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // حالة النجاح

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${snapshot.data!.name}'),
                  Image.network('${snapshot.data!.image}'),
                ],
              );
            } else {
              return Text("لا توجد بيانات");
            }
          },
        ),
      ),
    );
  }
}
