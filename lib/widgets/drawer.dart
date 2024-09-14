import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Import Provider for theme management
import 'package:tedx/utils/routes.dart';
import 'package:tedx/utils/theme_notifier.dart';  // Import your ThemeNotifier class

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme
    final themeNotifier = Provider.of<ThemeNotifier>(context);  // Access the ThemeNotifier

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Name",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,  // Ensure text contrasts well with the background
              ),
            ),
            accountEmail: Text(
              "name@gmail.com",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,  // Use primary color from the theme
            ),
            currentAccountPicture: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  "assets/undraw_Male_avatar_g98d-ai-brush-removebg-re28fm5.png",
                ),
                radius: 30,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: theme.iconTheme.color,  // Use icon color from the theme
            ),
            title: Text(
              "Profile",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: theme.textTheme.bodyLarge?.color,  // Use text color from the theme
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.RecruitmentRoute);
            },
            leading: Icon(
              CupertinoIcons.briefcase,
              color: theme.iconTheme.color,
            ),
            title: Text(
              "Recruitments",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.time,
              color: theme.iconTheme.color,
            ),
            title: Text(
              "Past Events",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: theme.iconTheme.color,
            ),
            title: Text(
              "Contact Us",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          const Divider(),  // Add a divider before the theme switcher
          SwitchListTile(
            title: Text(
              "Dark Mode",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            secondary: Icon(
              themeNotifier.isDarkMode ? CupertinoIcons.moon : CupertinoIcons.sun_max,
              color: theme.iconTheme.color,
            ),
            value: themeNotifier.isDarkMode,  // Get current theme mode from ThemeNotifier
            onChanged: (bool value) {
              themeNotifier.toggleTheme();  // Toggle the theme when the switch is used
            },
          ),
        ],
      ),
    );
  }
}
