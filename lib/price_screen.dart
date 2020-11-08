import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String value = '';
  int BTC =0;
String st = 'Choose Currency';
  int ETH=0;
  int LTC=0;




  void getData(String choice)async {
    http.Response response = await http.get('https://rest.coinapi.io/v1/exchangerate/BTC/$choice?apikey=11F7247C-71AD-455A-84EF-A58574B3ABBC');
    var result = jsonDecode(response.body);
    setState(() {
      st ='';
      BTC = result['rate'].toInt();
      value = result['asset_id_quote'];
      print('Rate: ${result['rate']}');
      print('curr: ${result['asset_id_quote']}');
    });
  }

  void getData1(String choice)async {
    http.Response response = await http.get('https://rest.coinapi.io/v1/exchangerate/ETH/$choice?apikey=11F7247C-71AD-455A-84EF-A58574B3ABBC');
    var result = jsonDecode(response.body);
    setState(() {
      ETH = result['rate'].toInt();
      value = result['asset_id_quote'];
      print('Rate: ${result['rate']}');
      print('curr: ${result['asset_id_quote']}');
    });



  }  void getData2(String choice)async {
    http.Response response = await http.get('https://rest.coinapi.io/v1/exchangerate/LTC/$choice?apikey=11F7247C-71AD-455A-84EF-A58574B3ABBC');
    var result = jsonDecode(response.body);
    setState(() {
      LTC = result['rate'].toInt();
      value = result['asset_id_quote'];
      print('Rate: ${result['rate']}');
      print('curr: ${result['asset_id_quote']}');
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $BTC $value',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ETH $value',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $LTC $value',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Container(

            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(

              iconSize: 50,
              hint: Text(
                  '$value$st',
                style: TextStyle(
                  color: Colors.white,
                  fontSize:25
                ),
              ),
              items: currenciesList.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),

              onChanged: (choice) {
                getData(choice);
                getData1(choice);
                getData2(choice);
              },
            ),
          ),
        ],
      ),
    );
  }
}
