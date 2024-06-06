import 'package:flutter/material.dart';

class AnimalSwitchListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final ValueChanged<bool> onChanged;
  final bool isSwitched;

  AnimalSwitchListTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onChanged,
    required this.isSwitched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
      title: Text(title),
      trailing: Switch(
        value: isSwitched,
        onChanged: onChanged,
      ),
    );
  }
}
