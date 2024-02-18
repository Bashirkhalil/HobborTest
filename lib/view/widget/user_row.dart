import 'package:flutter/material.dart';
import 'package:test_functionality/model/user_article.dart';

class UserRow extends StatefulWidget {

  User user;
  final Function(User user) onDelete;
  final Function(User user) onEdit;


  UserRow({
    required this.user ,
    required this.onEdit ,
    required this.onDelete , super.key});

  @override
  State<UserRow> createState() => _UserRowState();
}

class _UserRowState extends State<UserRow> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set border radius here
        color: Colors.white, // Set container background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.user.img_link),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.user.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.user.email,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
                onPressed: () {
                  widget.onEdit(widget.user);
                },
              ),
              IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    widget.onDelete(widget.user);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
