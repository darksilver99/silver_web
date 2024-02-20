// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/custom_functions.dart' as functions;
import 'package:omise_flutter/omise_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> setQRCodePayment(
  DocumentReference? paymentRef,
  String? price,
) async {
  // Add your function code here!

  var url = '';
  const publicKey = "pkey_test_5x1h5fbuqkwm8g53lm0";
  const secretKey = "skey_test_5x1cv8dk84i1twgjbxv";

  OmiseFlutter omise = OmiseFlutter(publicKey);
  print("secretKey");
  print(FFAppState().price);
  try {
    final source = await omise.source
        .create(functions.stringToInt(price!), "THB", "promptpay");

    const urlOmise = 'https://api.omise.co/charges';

    var convertKey = 'Basic ${base64Encode(utf8.encode('$secretKey:'))}';

    // อันนี้ได้ ไปแกะ package มันมา
    Map<String, String> header = {
      'Authorization': convertKey,
      'Omise-Version': '2019-05-29',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json',
      'user-agent': 'co.keerati.omise_flutter/0.1.6'
    };

    print("header");
    print(header);

    var requestBody = {
      'source': source.id,
      'amount': price!.toString(),
      'currency': "THB",
      'description': "ระบบเว็บ (SilverService)",
    };

    print("requestBody");
    print(requestBody);

    var response = await http.post(Uri.parse(urlOmise),
        body: jsonEncode(requestBody), headers: header);

    if (response.statusCode == 200) {
      print('successful!');

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData["source"]["scannable_code"]["image"]["download_uri"]);

      url =
          "https://silver-api.com/qr.php?path=${jsonData["source"]["scannable_code"]["image"]["download_uri"].toString().replaceAll("https://", "")}";

      var paymentID = jsonData["id"];
      await paymentRef!.update(createPaymentHistoryListRecordData(
        paymentOrder: paymentID,
      ));
    } else {
      print('failed with status code: ${response.statusCode}');
      print('${response.body}');
    }
  } catch (e) {
    // error(e);
    print(e);
  }

  return url;
}
