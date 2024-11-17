import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final int reactionsCount;
  final int commentsCount;
  final VoidCallback onReact;
  final VoidCallback onComment;

  const PostCard({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
    this.reactionsCount = 0,
    this.commentsCount = 0,
    required this.onReact,
    required this.onComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                final imageProvider = Image.network(imageUrl).image;
                showImageViewer(context, imageProvider,
                    onViewerDismissed: () {});
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    );
                  }, // Mostra um ícone se a imagem falhar
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: onReact,
                    ),
                    Text('$reactionsCount'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment_outlined),
                      onPressed: onComment,
                    ),
                    Text('$commentsCount'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
