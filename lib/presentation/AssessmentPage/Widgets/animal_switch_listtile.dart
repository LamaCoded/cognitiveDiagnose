import 'package:flutter/material.dart';

class AnimalSwitchListTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final ValueChanged<bool> onChanged;
  bool isSwitched;
  AnimalSwitchListTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onChanged,
    this.isSwitched = false,
  }) : super(key: key);

  @override
  State<AnimalSwitchListTile> createState() => _AnimalSwitchListTileState();
}

class _AnimalSwitchListTileState extends State<AnimalSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      title: Text(widget.title),
      trailing: Switch(
        value: widget.isSwitched,
        onChanged: (value) {
          setState(() {
            widget.isSwitched = value;
          });
          print('===========');
          print(value);
          print('===========');

          widget.onChanged;
        },
      ),
    );
  }
}
