import 'package:flutter/material.dart';

class PastEventsPage extends StatelessWidget {
  const PastEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Past Events",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),  // Use the theme's title style
        ),
        backgroundColor: theme.primaryColor,  // Keep the app bar color consistent with the theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // Sample Event 1
            EventCard(
              imageUrl: "assets/tedx black logo.png",
              eventTitle: "The Unveiled Road",
              eventDate: "July 15, 2023",
              eventDescription: "A remarkable event featuring world-renowned speakers and thought leaders discussing innovation and creativity.",
            ),
            SizedBox(height: 20),  // Add space between event cards

            // Sample Event 2
            EventCard(
              imageUrl: "assets/tedx black logo.png",
              eventTitle: "TEDx 2022",
              eventDate: "December 10, 2022",
              eventDescription: "An empowering event highlighting the achievements of women in technology and fostering inclusivity in the tech industry.",
            ),
            SizedBox(height: 20),

            // Sample Event 3
            EventCard(
              imageUrl: "assets/tedx black logo.png",
              eventTitle: "TEDx 2021",
              eventDate: "November 2, 2021",
              eventDescription: "An inspiring event showcasing young innovators who are changing the world with their ideas.",
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String eventDate;
  final String eventDescription;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventDate,
    required this.eventDescription,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12),
              child: Image.asset(
                imageUrl,
                height: 80,
                
               // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                Text(
                  eventTitle,
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Event Date
                Text(
                  eventDate,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 8),

                // Event Description
                Text(
                  eventDescription,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
