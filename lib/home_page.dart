import 'package:flutter/material.dart';
import 'package:nightlyfe/myevents.dart';
import 'package:nightlyfe/rewards.dart';
import 'menu.dart';
import 'settings.dart';
import 'package:nightlyfe/assets/widgets/eventWidget.dart';
import 'assets/functionals/pointsDisplay.dart';
import 'tiers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292929),
      appBar: AppBar(
        title: const Text('Home',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 33,
                fontFamily: 'BebasNeue')),
        backgroundColor: const Color(0xFF4a0404),
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: const [
          PointsDisplay(), //APP BAR POINTS DISPLAY
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF4a0404),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              },
            ),
            ListTile(
              title: const Text('My Events',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyEvents()),
                );
              },
            ),
            ListTile(
              title: const Text('Rewards',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rewards()),
                );
              },
            ),
            ListTile(
              title: const Text('Tiers',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tiers()),
                );
              },
            ),
            ListTile(
              title: const Text('Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'BebasNeue')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: const Text(
                      "Schedule",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'PressStart2P'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'lib/assets/images/home/schedule2.png',
                      width: 380,
                      height: 400,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: const Text(
                      "Upcoming",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'PressStart2P'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const EventWidget(
                    title: 'Sideras x Saza',
                    bottomText: '18/12/2024  9:00 PM - LATE HOURS',
                    date: '18/12/2024  9:00 PM - LATE HOURS',
                    imagePath: 'lib/assets/images/home/mid-week.png',
                    description:
                    'They are a high-energy DJ duo specializing in the electrifying fusion of tech house and afrobeats. '
                        'Known for their vibrant "party animal" vibes, they bring an unmatched level of excitement to every performance, lighting up dance floors and captivating audiences with their dynamic sets. '
                        'Whether at nightclubs, festivals, or private events, they create unforgettable experiences through their infectious rhythms and connection with the crowd. '
                        'With a passion for fun and a talent for energizing any space, this duo is all about turning up the vibe and making every moment a celebration of music and movement.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const EventWidget(
                    title: 'APARAPIRA PARAPE',
                    date: '05/01/2025  9:00 PM - LATE HOURS',
                    description:
                    "Aparapira Parape is a dynamic DJ duo from Cyprus, known for their eclectic sets that blend genres like wonky acid and disco. The duo consists of George Papa and Joseph Herodotou, who have been friends for life and share a passion for music and unique creativity. They've gained recognition for organizing successful warehouse parties in Limassol and have become well-known for their energetic performances. Their sets are characterized by a diverse selection of tracks, creating a lively atmosphere that resonates with audiences. They've gained recognition for organizing successful warehouse parties in Limassol and have become well-known for their energetic performances. Their sets are characterized by a diverse selection of tracks, creating a lively atmosphere that resonates with audiences. Aparapira Parape has performed at various events, including the AfroBanana festival, where they've been described as an act like no other, captivating crowds with their legendary sets. With their unique blend of styles and a contagious energy, Aparapira Parape is a dynamic force in the world of DJing and music.",
                    imagePath: 'lib/assets/images/home/aparapi.png',
                    bottomText: '05/01/2025  9:00 PM - LATE HOURS',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Rewards()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'lib/assets/images/home/sousami-logo.png',
                    width: 67,
                    height: 67,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
