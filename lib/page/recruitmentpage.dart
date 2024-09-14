import 'package:flutter/material.dart';
import 'package:tedx/utils/routes.dart';

class RecruitmentPage extends StatefulWidget {
  const RecruitmentPage({super.key});

  @override
  State<RecruitmentPage> createState() => _RecruitmentPageState();
}

class _RecruitmentPageState extends State<RecruitmentPage> {
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {  // Validate form
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recruitment",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),  // Use the theme's title style
        ),
        backgroundColor: theme.primaryColor,  // Use theme's primary color
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Attach the form key
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Added padding to form content
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Register",
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: theme.primaryColor,  // Use theme's primary color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",
                    labelStyle: theme.textTheme.bodyMedium,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter USN",
                    labelText: "USN",
                    labelStyle: theme.textTheme.bodyMedium,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "USN cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Phone number",
                    labelText: "Phone number",
                    labelStyle: theme.textTheme.bodyMedium,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: theme.colorScheme.onPrimary,
                            )
                          : Text(
                              "Submit",
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
