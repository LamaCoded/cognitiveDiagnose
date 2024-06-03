import 'package:flutter/material.dart';

class AnimalSwitchListTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const AnimalSwitchListTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.value,
    required this.onChanged,
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
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}
