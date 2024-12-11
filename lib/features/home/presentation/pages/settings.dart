import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
      isNotificationsEnabled = prefs.getBool('notifications') ?? true;
      selectedLanguage = prefs.getString('language') ?? 'English';
    });
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDarkMode);
    await prefs.setBool('notifications', isNotificationsEnabled);
    await prefs.setString('language', selectedLanguage);
  }

  Future<void> _handleLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all preferences

    // Add any other cleanup needed
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/signin', (route) => false,
          arguments: 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildSection(
                      'Appearance',
                      [
                        SwitchListTile(
                          title: const Text('Dark Mode'),
                          value: isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                              saveSettings();
                            });
                          },
                        ),
                      ],
                    ),
                    _buildSection(
                      'Notifications',
                      [
                        SwitchListTile(
                          title: const Text('Enable Notifications'),
                          value: isNotificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              isNotificationsEnabled = value;
                              saveSettings();
                            });
                          },
                        ),
                      ],
                    ),
                    _buildSection(
                      'Language',
                      [
                        ListTile(
                          title: const Text('Select Language'),
                          trailing: DropdownButton<String>(
                            value: selectedLanguage,
                            items: ['English', 'Amharic']
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedLanguage = newValue;
                                  saveSettings();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    _buildSection(
                      'About',
                      [
                        ListTile(
                          title: const Text('Version'),
                          trailing: const Text('1.0.0'),
                        ),
                        ListTile(
                          title: const Text('Terms of Service'),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Navigate to Terms of Service
                          },
                        ),
                        ListTile(
                          title: const Text('Privacy Policy'),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Navigate to Privacy Policy
                          },
                        ),
                      ],
                    ),
                    _buildSection(
                      'Account',
                      [
                        ListTile(
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: const Icon(
                            Icons.logout_rounded,
                            color: Colors.red,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Logout'),
                                  content: const Text(
                                      'Are you sure you want to logout?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close dialog
                                        _handleLogout(context);
                                      },
                                      child: const Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3085FE),
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}
