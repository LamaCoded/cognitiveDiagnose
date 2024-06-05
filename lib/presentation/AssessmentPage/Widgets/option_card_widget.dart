import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final int index;
  final Function(int) onClicked;

  const OptionCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.index,
    required this.onClicked,
  }) : super(key: key);

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _isSelected ? Colors.orange : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: _toggleSelection,
        leading: Icon(
          _isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
          color: _isSelected ? Colors.orange : Colors.grey,
        ),
        title: Text(widget.text),
      ),
    );
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onClicked(widget.index);
    });
  }
}
