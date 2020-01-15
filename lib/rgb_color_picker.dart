library rgb_color_picker;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RGBColorPickerDialog extends StatefulWidget {
  @override
  _RGBColorPickerDialogState createState() => _RGBColorPickerDialogState();

  Color color;
  final Color redSliderActiveColor;
  final Color blueSliderActiveColor;
  final Color greenSliderActiveColor;
  final Color redSliderThumbColor;
  final Color greenSliderThumbColor;
  final Color blueSliderThumbColor;
  final Color redSliderInActiveColor;
  final Color greenSliderInActiveColor;
  final Color blueSliderInActiveColor;
  final Color buttonTextColor;

  RGBColorPickerDialog({
    Key key,
    this.color,
    this.redSliderActiveColor = Colors.lightBlueAccent,
    this.blueSliderActiveColor = Colors.lightBlueAccent,
    this.greenSliderActiveColor = Colors.lightBlueAccent,
    this.redSliderThumbColor = Colors.lightBlueAccent,
    this.greenSliderThumbColor = Colors.lightBlueAccent,
    this.blueSliderThumbColor = Colors.lightBlueAccent,
    this.redSliderInActiveColor = Colors.lightBlueAccent,
    this.greenSliderInActiveColor = Colors.lightBlueAccent,
    this.blueSliderInActiveColor = Colors.lightBlueAccent,
    this.buttonTextColor = Colors.lightBlueAccent,
  }) : super(key: key);
}

class _RGBColorPickerDialogState extends State<RGBColorPickerDialog> {
  double redSliderValue = 100;
  double blueSliderValue = 100;
  double greenSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 20,
                backgroundColor: Colors.redAccent,
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: widget.redSliderThumbColor,
                ),
                child: Slider(
                  min: 0,
                  max: 256,
                  value: redSliderValue,
                  onChanged: (value) {
                    setState(() {
                      redSliderValue = value;
                    });
                  },
                  activeColor: widget.redSliderActiveColor,
                  inactiveColor: widget.redSliderInActiveColor,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 20,
                backgroundColor: Colors.lightGreen,
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: widget.greenSliderThumbColor,
                ),
                child: Slider(
                  min: 0,
                  max: 256,
                  value: greenSliderValue,
                  onChanged: (value) {
                    setState(() {
                      greenSliderValue = value;
                    });
                  },
                  activeColor: widget.greenSliderActiveColor,
                  inactiveColor: widget.greenSliderInActiveColor,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 20,
                backgroundColor: Colors.blueAccent,
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: widget.blueSliderThumbColor,
                ),
                child: Slider(
                  min: 0,
                  max: 256,
                  value: blueSliderValue,
                  onChanged: (value) {
                    setState(() {
                      blueSliderValue = value;
                    });
                  },
                  activeColor: widget.blueSliderActiveColor,
                  inactiveColor: widget.blueSliderInActiveColor,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          textColor: widget.buttonTextColor,
          child: Text(
            'PICK',
          ),
          onPressed: () {
            setState(() {
              widget.color = Color.fromRGBO(redSliderValue.round(),
                  greenSliderValue.round(), blueSliderValue.round(), 1);
            });
          },
        ),
        FlatButton(
          textColor: widget.buttonTextColor,
          child: Text(
            'CANCEL',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
