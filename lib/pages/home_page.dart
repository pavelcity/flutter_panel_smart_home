import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home_ui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List mySmartDevices = [
    ['Smart Light', 'assets/icons/light-bulb.png', false],
    ['Smart AC', 'assets/icons/air-conditioner.png', false],
    ['Smart TV', 'assets/icons/smart-tv.png', false],
    ['Smart Fan', 'assets/icons/fan.png', false],
  ];

  void powerSwithChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      'assets/icons/menu.png',
                      height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 43,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),
        
            //welcome home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home', style: TextStyle(fontSize: 16),),
                  Text('MITCH KOKO', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Divider(
              color: Colors.grey[400],
              thickness: 2,
            ),
            SizedBox(height: 10,),
            //smart devices
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('Smart Devices', style: TextStyle(fontSize: 22),),
            ),

            Expanded(
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                    padding: EdgeInsets.all(25),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      deviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwithChanged(value, index),
                    );
                  },
                ),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
