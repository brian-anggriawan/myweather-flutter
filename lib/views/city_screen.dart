import 'package:flutter/material.dart';
import '../utils/contants.dart';

class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreen();
}

class _CityScreen extends State<CityScreen> {
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop,
              ),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          inputValue = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        hintText: 'Enter City Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, inputValue);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
