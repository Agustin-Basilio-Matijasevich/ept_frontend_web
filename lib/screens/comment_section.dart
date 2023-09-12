import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:ept_frontend/services/comments.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/comentario.dart';
import '../models/usuario.dart';
import '../widgets/login_button.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  final Color backgroundColor = const Color(0xffed068d);

  Widget commentChild(List<Comentario> data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              title: Text(
                data[i].autor,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i].contenido),
              trailing: RatingBarIndicator(
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50,
                direction: Axis.horizontal,
                rating: data[i].puntaje.index + 1,
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Usuario? user = Provider.of<Usuario?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina de comentarios"),
        backgroundColor: backgroundColor,
        actions: [
          LoginButton(),
        ],
      ),
      body: Container(
        child: CommentBox(
          labelText: 'Escriba un comentario...',
          errorText: 'El comentario no puede estar vacio',
          withBorder: false,
          sendButtonMethod: () async {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              // var a = FutureBuilder(future: _showMyDialog(), builder: (context, snapshot) => snapshot.data!,);
              CommentPuntaje rating = CommentPuntaje.cincoestrellas;
              await showDialog(
                context: context,
                builder: (context) => RatingDialog(),
              ).then((valueFromDialog) {
                rating = valueFromDialog;
              });

              Comentario comment = Comentario(
                user == null ? 'Anónimo' : user.nombre,
                commentController.text,
                rating,
              );

              setState(() {
                CommentsService().grabaComentario(comment);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: backgroundColor,
          textColor: Colors.white,
          sendWidget: const Icon(
            Icons.send_sharp,
            size: 30,
            color: Colors.white,
          ),
          child: FutureBuilder(
            future: CommentsService().getComentarios(),
            initialData: <Comentario>[
              Comentario(
                  'Cargando comentarios', '', CommentPuntaje.cincoestrellas)
            ],
            builder: ((context, snapshot) {
              return commentChild(snapshot.data! as List<Comentario>);
            }),
          ),
        ),
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();

  double? val;

  RatingDialog({
    super.key,
  });
}

class _RatingDialogState extends State<RatingDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CommentPuntaje? value;
    return AlertDialog(
      title: Text('Ingrese la calificación que nos daría'),
      content: RatingBar.builder(
        // initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          value = CommentPuntaje.values.elementAt((rating - 1) as int);
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (value != null) {
              Navigator.pop(
                context,
                value,
              );
            }
          },
          child: const Text('Enviar'),
        ),
      ],
    );
  }
}
