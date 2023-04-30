import 'package:flutter/material.dart';

import '../constants/constants.dart';

class VibrationDialog extends StatefulWidget {
  const VibrationDialog({Key? key, required this.initialVibration})
      : super(key: key);
  final bool initialVibration;

  @override
  State<VibrationDialog> createState() => _VibrationDialogState();
}

class _VibrationDialogState extends State<VibrationDialog> {
  bool? vibration;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constances.blueBackground,
      title: Text(
        'Vibration Mode',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      content: Container(
        child: Switch(
          value: vibration ?? widget.initialVibration,
          onChanged: (val) {
            setState(() {
              vibration = val;
            });
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Use the second argument of Navigator.pop(...) to pass
            // back a result to the page that opened the dialog
            Navigator.pop(context, vibration);
          },
          child: Text(
            'DONE',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    vibration = widget.initialVibration;
  }
}
