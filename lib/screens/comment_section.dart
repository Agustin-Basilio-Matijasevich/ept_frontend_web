import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Pedrito Perez',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Muy bueno!',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Gonzalo Martinez',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'bokeeeee',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Plácido',
      'pic': 'assets/img/userpic.jpg',
      'message': 'Plácido',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Guido Kaczka',
      'pic': 'https://picsum.photos/300/30',
      'message': 'A ver, poneme la repe',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina de comentarios"),
        backgroundColor: const Color(0xffed068d),
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/img/userpic.jpg"),
          labelText: 'Escriba un comentario...',
          errorText: 'El comentario no puede estar vacio',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'Anónimo',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text,
                  'date': DateTime.now().toString()
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: const Color(0xffed068d),
          textColor: Colors.white,
          sendWidget: const Icon(
            Icons.send_sharp,
            size: 30,
            color: Colors.white,
          ),
          child: commentChild(filedata),
        ),
      ),
    );
  }
}
