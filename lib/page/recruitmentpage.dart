import 'package:flutter/material.dart';
import 'package:tedx/utils/routes.dart';

class Recruitmentpage extends StatefulWidget {
  const Recruitmentpage({super.key});

  @override
  State<Recruitmentpage> createState() => _RecruitmentpageState();
}

class _RecruitmentpageState extends State<Recruitmentpage> {
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
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey, // Attach the form key
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "RECRUITMENT",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                   color: Color.fromARGB(255, 234, 21, 6),  
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                
                padding: const EdgeInsets.symmetric(horizontal: 30),
                
                child: Column(
                  
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter USN",
                        labelText: "USN",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "USN cannot be empty";
                        }
                        // Add more specific validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      keyboardType:TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Phone number",
                        labelText: "Phone number",
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone number cannot be empty";
                        }
                        // Add more specific validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 80),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 234, 21, 6),  
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
