import 'package:flutter/material.dart';
import 'package:myapp/components/CardPost.dart';
import 'package:myapp/controllers/home_controller.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool isLoading = true;
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: () async {
      var data = await controller.fetchPosts();
      setState(() {
        isLoading = false;
      });

      return data;
    }(), builder: (ctx, data) {
      var posts = data.data;
      return ListView.builder(
          itemCount: posts?.length ?? 0,
          itemBuilder: (ctx, index) {
            final post = posts?[index];
            return PostCard(
              title: post?.titulo ?? 'Sem título',
              content: post?.conteudo ?? 'Sem conteúdo',
              imageUrl:
                  post?.imagePath ?? 'https://via.placeholder.com/300x200',
              reactionsCount: 0,
              commentsCount: 0,
              onReact: () => debugPrint('Reagiu ao post ${post?.id}'),
              onComment: () => debugPrint('Comentou no post ${post?.id}'),
            );
          });
    });
  }
}
