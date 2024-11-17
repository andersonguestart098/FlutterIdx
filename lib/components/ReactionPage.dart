import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReactionsPage extends StatelessWidget {
  final String postId;

  const ReactionsPage({Key? key, required this.postId}) : super(key: key);

  Future<List<dynamic>> _fetchReactions() async {
    final response = await http.get(Uri.parse(
        'https://cemear-b549eb196d7c.herokuapp.com/posts/$postId/reactions/details'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar detalhes das reações');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reações'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchReactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma reação encontrada'),
            );
          }

          final reactions = snapshot.data!;
          return ListView.builder(
            itemCount: reactions.length,
            itemBuilder: (context, index) {
              final reaction = reactions[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(reaction['user']['usuario']),
                subtitle: Text('Reação: ${reaction['type']}'),
              );
            },
          );
        },
      ),
    );
  }
}
