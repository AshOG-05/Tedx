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
            currentPosition + 200, // Scroll by the width of one card
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
    final theme = Theme.of(context); // Use the current theme
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: isDarkMode?
         Image.asset(
          "assets/Tedx logo -Photoroom.png",
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          height: 55,
        )
        :Image.asset(
          "assets/tedx black logo.png",
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          height: 55,
      ),),
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
                        gradient: LinearGradient(
                          colors: isDarkMode
                              ? [Color(0xFF444444), Color(0xFF222222)] // Dark theme gradient
                              : [Color(0xFF00C6FF), Color(0xFF0072FF)], // Light theme gradient
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 52),
                          Text(
                            "THEME 2024",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(
                            "Beyond",
                            style: theme.textTheme.displayLarge!.copyWith(fontFamily: GoogleFonts.ultra().fontFamily,fontSize: 54,fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "The Canvas",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Our TEDx 2024 theme, "Beyond the Canvas," celebrated the boundless potential of creativity.It invited our audience to step outside the familiar frames of thought and explore the unseen—the stories, ideas, and innovations that defy convention. Like a masterpiece that stretches beyond its borders,the event was a vibrant fusion of art and intellect, inspiring attendees to reimagine what lies beyond the ordinary.',
          
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 74),
                  Text(
                    'SPEAKERS',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Speakers Section
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
                  color: theme.cardColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: item.image.isNotEmpty
                          ? AssetImage(item.image)
                          : null,
                      child: item.image.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 35,
                              color: theme.iconTheme.color,
                            )
                          : null,
                    ),
                    title: Text(
                      item.name,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item.desc,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.textTheme.bodyMedium!.color,
                      ),
                    ),
                  ),
                );
              },
              childCount: Speakers.items.length,
            ),
          ),

          //Sponsors Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 72),
                  Text(
                    'OUR SPONSORS',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w900,
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 12.0),
                          elevation: 5,
                          color: theme.cardColor,
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
                                      ? Icon(
                                          Icons.business,
                                          size: 50,
                                          color: theme.iconTheme.color,
                                        )
                                      : null,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  unit.name,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  unit.desc,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 72),
                  Text(
                    'ABOUT TEDx',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    textAlign: TextAlign.center,
                    'Welcome to TEDx, where ideas come to life! Our club is a dynamic space for innovators, thinkers, and creators dedicated to organizing TEDx events that ignite inspiration. From curating speakers and crafting immersive experiences to storytelling and stage design, we offer the chance to be part of something bigger.Join us in shaping impactful conversations that push boundaries and spark change!',
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
