import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        backgroundColor: Colors.blueAccent, // Custom color for the AppBar
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10), // Add padding around the list
        itemCount: 10, // Number of messages
        itemBuilder: (context, index) {
          return MessageTile(
            sender: 'Sender ${index + 1}', // Example sender
            message: 'This is a message preview for message ${index + 1}.',
            time: '10:${index} AM', // Example time
            isRead: index % 2 == 0, // Mark even messages as read
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isRead;

  MessageTile({
    required this.sender,
    required this.message,
    required this.time,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds shadow for a 3D effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16), // Add padding inside each tile
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent, // Custom avatar background
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          sender,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(
          message,
          maxLines: 1, // Show only one line of the message
          overflow: TextOverflow.ellipsis, // Add "..." at the end if too long
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            if (!isRead)
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red, // Red dot for unread messages
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {
          // Define what happens when the message is tapped
          print('Message tapped!');
        },
      ),
    );
  }
}
