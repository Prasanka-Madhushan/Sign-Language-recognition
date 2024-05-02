import 'package:flutter/material.dart';
import 'package:hand_gesture/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider {
  bool _notificationsEnabled = true;

  Future<bool> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    return _notificationsEnabled;
  }

  Future<void> toggleNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', value);
    _notificationsEnabled = value;
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  final SettingsProvider settingsProvider = SettingsProvider();

  @override
  void initState() {
    super.initState();
    settingsProvider.loadPreferences().then((enabled) {
      setState(() {
        notificationsEnabled = enabled;
      });
    });
  }

  Future<void> _signOut() async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.signOut();
      // Clear any user data or session information
      //await SharedPreferences.getInstance().clear();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error signing out. Please try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                });
                settingsProvider.toggleNotifications(value);
              },
            ),
            ListTile(
              title: Text('Manage Account'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Account Management'),
                    content: Text('Manage your account settings here.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Privacy Policy'),
                    content: Text('Here is the privacy policy.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                _signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}