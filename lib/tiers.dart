import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'assets/functionals/keys.dart';
import 'package:http/http.dart' as http;
import 'assets/functionals/pointsDisplay.dart';
import 'package:nightlyfe/services/point_handler.dart';

class Tiers extends StatefulWidget {
  const Tiers({super.key});

  @override
  State<Tiers> createState() => _TiersState();
}

class _TiersState extends State<Tiers> {
  static Map<String, dynamic>? intentPaymentData;

  // Stripe: Show Payment Sheet
  showPaymentSheet(String tier) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((val) {
        setState(() {
          if (tier == "Bronze") {
            PointsHandler.addPoints(300);
          } else if (tier == "Gold") {
            PointsHandler.addPoints(600);
          } else if (tier == "Diamond") {
            PointsHandler.addPoints(900);
          }
        });

        print("Payment successful! New points total: ${PointsHandler.getPoints()}");
        intentPaymentData = null;
      }).onError((e, stackTrace) {
        if (kDebugMode) {
          print("$e\n$stackTrace");
        }
      });
    } on StripeException catch (e) {
      showDialog(
          context: context,
          builder: (c) => const AlertDialog(
            title: Text("Cancelled"),
          ));
    } catch (e) {
      print("Error: $e");
    }
  }

  // Initialize Payment Sheet
  paymentSheetInitialization(double amountToPay, String currency, String tier) async {
    try {
      intentPaymentData = await makeIntentForPayment(amountToPay, currency);

      if (intentPaymentData == null) {
        throw Exception("Failed to retrieve payment intent data");
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: intentPaymentData!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: "NightLyfe App",
        ),
      );

      showPaymentSheet(tier);
    } catch (e) {
      print(e);
    }
  }

  // Create Payment Intent
  makeIntentForPayment(double amountToPay, String currency) async {
    try {
      int amountInSmallestUnit = (amountToPay * 100).toInt();
      print("Debug: Converted amount to cents -> $amountInSmallestUnit");

      if (amountInSmallestUnit < 50) {
        throw Exception("Amount must be at least 50 cents.");
      }

      Map<String, dynamic> paymentInfo = {
        "amount": amountInSmallestUnit.toString(),
        "currency": currency,
        "payment_method_types[]": "card",
      };

      var responseFromStripe = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: paymentInfo,
        headers: {
          "Authorization": "Bearer $SecretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      Map<String, dynamic> responseData = jsonDecode(responseFromStripe.body);
      if (responseData.containsKey('error')) {
        print("Stripe API Error: ${responseData['error']['message']}");
        throw Exception(responseData['error']['message']);
      }

      return responseData;
    } catch (e) {
      print("Error in makeIntentForPayment: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tiers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'BebasNeue',
          ),
        ),
        backgroundColor: const Color(0xFF4a0404),
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: const [PointsDisplay()],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Ensure full height
        decoration: const BoxDecoration(color: Color(0xFF292929)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Tiers',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'PressStart2P',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 1.5, color: Colors.deepOrange),
              ),
              const SizedBox(height: 20),

              // Tiers List
              _buildTier(
                title: "Diamond",
                color: const Color(0xFF00bdfd),
                collapsedColor: const Color(0xFF03e6fe),
                benefits: [
                  "- Pay-Later benefit",
                  "- Complimentary Drink upon entrance",
                  "- Point accumulation for redeeming beverages",
                  "- Free entrance"
                ],
                price: 3.00,
              ),
              _buildTier(
                title: "Gold",
                color: const Color(0xFFd4ad00),
                collapsedColor: const Color(0xFFfee303),
                benefits: [
                  "- Complimentary Drink upon entrance",
                  "- Point accumulation for redeeming beverages",
                  "- Free entrance"
                ],
                price: 2.00,
              ),
              _buildTier(
                title: "Bronze",
                color: const Color(0xFFbf5902),
                collapsedColor: const Color(0xFFfd7500),
                benefits: [
                  "- Point accumulation for redeeming beverages",
                  "- Free entrance"
                ],
                price: 1.00,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Tier
  Widget _buildTier({
    required String title,
    required Color color,
    required Color collapsedColor,
    required List<String> benefits,
    required double price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'PressStart2P',
          ),
        ),
        collapsedBackgroundColor: collapsedColor,
        backgroundColor: color,
        iconColor: Colors.white,
        collapsedIconColor: Colors.black,
        childrenPadding: const EdgeInsets.all(10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: benefits.map((benefit) {
              return Text(
                benefit,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'PressStart2P',
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              paymentSheetInitialization(price, "USD", title);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Select $title',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'PressStart2P',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
