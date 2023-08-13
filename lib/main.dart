// ignore_for_file: avoid_print

import 'package:api_calling/api_client.dart';
import 'package:api_calling/post_model.dart';
import 'package:flutter/material.dart';

// Craete an instance of the class APIClient
APIClient apiClient = APIClient();
List<Posts>? allPosts;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostsScreen(),
    );
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    allPosts = await apiClient.fetchData();

    print(allPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "API Calling",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ListView builder
      body: ListView.builder(
        itemCount: allPosts!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(allPosts![index].title),
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
