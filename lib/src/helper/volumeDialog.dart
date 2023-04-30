import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';

class VolumeDialog extends StatefulWidget {
  /// initial selection for the slider
  final double initialVolume;

  VolumeDialog({required this.initialVolume});

  @override
  _VolumeDialogState createState() => _VolumeDialogState();
}

class _VolumeDialogState extends State<VolumeDialog> {
  /// current selection of the slider
  double? _volume;

  @override
  void initState() {
    super.initState();
    _volume = widget.initialVolume;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constances.blueBackground,
      title: Text(
        'Volume Level',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      content: Container(
        height: 20.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _volume!,
              min: 10,
              max: 100,
              divisions: 9,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
            Text(
              'Volume Level: ${_volume}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Use the second argument of Navigator.pop(...) to pass
            // back a result to the page that opened the dialog
            Navigator.pop(context, _volume);
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
}
