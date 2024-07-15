import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

   SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.iconPath,
      required this.powerOn,
      required this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[50] : Colors.grey[300],
          borderRadius: BorderRadius.circular(24)
        ),
        // color: Colors.deepPurpleAccent,
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath, height: 100, color: powerOn ? Colors.brown[400] : Colors.brown[200],),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(deviceName,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: powerOn ? Colors.green : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
