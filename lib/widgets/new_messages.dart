import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _messagesController = TextEditingController();

  @override
  void dispose() {
    _messagesController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    final enteredMessage = _messagesController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    //Send to firebase

    _messagesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _messagesController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: const InputDecoration(labelText: 'Send a message...'),
          )),
          IconButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                _submitMessage();
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
