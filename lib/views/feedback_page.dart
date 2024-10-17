import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/components/custom_input.dart';
import 'package:flutter_application_5/services/db_service.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({super.key});

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nome'),
            subtitle: Text('Comentário'),
            leading: CircleAvatar(),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("14/10"),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: CustomInput(
              labelText: '',
              controller: messageController,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            )),
            IconButton(
              splashRadius: 1,
              onPressed: () {},
              icon: Icon(Icons.mic),
            ),
            IconButton(
              splashRadius: 1,
              onPressed: () async {
                await FirebaseDbService().postFeedback(messageController.text);
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
