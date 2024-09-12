import 'dart:async'; // Import for Timer
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tedx/Speakers/catalog.dart';
import 'package:tedx/Sponsors/sponsors.dart';
import 'package:tedx/widgets/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollController _scrollController; // ScrollController for sponsors
  late Timer _timer; // Timer for automatic scrolling

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Initialize ScrollController
    loadData();
    startAutoScroll();
  }

  // Load data from JSON files
  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/speakers.json");
    final decodedData = jsonDecode(catalogJson);
    var speakersData = decodedData["speakers"];
    Speakers.items = List.from(speakersData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    final sponsorsJson = await rootBundle.loadString("assets/sponsors.json");
    final decodedSponsorsData = jsonDecode(sponsorsJson);
    var sponsorsData = decodedSponsorsData["sponsors"];
    Sponsors.units = List.from(sponsorsData)
        .map<Unit>((unit) => Unit.fromMap(unit))
        .toList();

    setState(() {});
  }

  // Start automatic scrolling for the horizontal list
  void startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.offset;

        if (currentPosition < maxScrollExtent) {
          _scrollController.animateTo(
            currentPosition +200, // Scroll by the width of one card
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            0, // Scroll back to the beginning
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    _scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Image.asset(
          "assets/tedx black logo.png",
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          height: 55,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                      height: 272,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 52),
                          Text(
                            "THEME 2024",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontFamily: GoogleFonts.firaSans().fontFamily,
                            ),
                          ),
                          Text(
                            "Beyond",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                              fontSize: 54,
                              color: Colors.white,
                              fontFamily: GoogleFonts.ultra().fontFamily,
                            ),
                          ),
                          Text(
                            "The Canvas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: GoogleFonts.firaSans().fontFamily,
                              shadows: [
                                Shadow(
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 74),
                  Text(
                    'ABOUT THE THEME',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 245, 54, 40),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit doloremque corporis numquam debitis et dicta necessitatibus corrupti laboriosam vel error porro rerum! Ipsam ratione inventore cupiditate harum consequuntur eum neque sapiente quibusdam...',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 74),
                  const Text(
                    'SPEAKERS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= Speakers.items.length) {
                  return null;
                }
                final item = Speakers.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: item.image.isNotEmpty
                          ? NetworkImage(item.image)
                          : null,
                      child: item.image.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      item.desc,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    tileColor: const Color.fromARGB(255, 248, 249, 250),
                  ),
                );
              },
              childCount: Speakers.items.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 72),
                  const Text(
                    'OUR SPONSORS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200, // Adjust the height of the cards
                    child: ListView.builder(
                      controller: _scrollController, // Attach the scroll controller
                      scrollDirection: Axis.horizontal,
                      itemCount: Sponsors.units.length,
                      itemBuilder: (context, index) {
                        final unit = Sponsors.units[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12.0),
                          elevation: 5,
                          child: Container(
                            width: 200, // Adjust the width of the sponsor cards
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: unit.image.isNotEmpty
                                      ? NetworkImage(unit.image)
                                      : null,
                                  child: unit.image.isEmpty
                                      ? const Icon(
                                          Icons.business,
                                          size: 50,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  unit.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  unit.desc,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 72),
                   const Text(
                    'ABOUT TEDx',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 245, 54, 40),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit doloremque corporis numquam debitis et dicta necessitatibus corrupti laboriosam vel error porro rerum! Ipsam ratione inventore cupiditate harum consequuntur eum neque sapiente quibusdam...',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 74),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
