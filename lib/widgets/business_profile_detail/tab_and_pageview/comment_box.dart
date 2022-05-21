import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/comment/comment.dart';

class CommentBoxx extends StatefulWidget {
  const CommentBoxx({Key? key}) : super(key: key);

  @override
  State<CommentBoxx> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBoxx> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {'name': 'Adeleye Ayodeji', 'message': 'I love to code'},
    {'name': 'Biggi Man', 'message': 'Very cool'},
    {'name': 'Biggi Man', 'message': 'Very cool'},
    {'name': 'Biggi Man', 'message': 'Very cool'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CommentBox(
        // Oluşturduğumuz CommentBox sınıfı çağırıyoruz burada
        child: commentChild(filedata),
        errorText: 'Yorum Boş Olamaz',
        sendMessageComment: () {
          if (formKey.currentState!.validate()) {
            print(commentController.text);
            setState(() {
              var value = {'name': "Mustafa", 'message': commentController.text};
              filedata.insert(0, value);
            });
            commentController.clear();
            FocusScope.of(context).unfocus();
          } else {}
        },
        hintText: 'Yorum yazınız..',
        formKey: formKey,
        commetController: commentController,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
      ),
    );
  }

  Widget commentChild(data) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          for (var i = 0; i < data.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                title: Text(
                  data[i]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data[i]['message']),
              ),
            )
        ],
      ),
    );
  }
}
