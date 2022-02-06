import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  bool alertPolice = true;
  bool alertNearby = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SettingsList(
        applicationType: ApplicationType.both,
        sections: [
          SettingsSection(
            title: Text(
              'SOS Settings',
              style: TextStyle(fontSize: 20),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.contact_page),
                title: Text('Emergency Contacts'),
                onPressed: (context) {
                  Navigator.pushNamed(
                      context, '/settings/emergency_contact_settings');
                },
              ),
              SettingsTile.switchTile(
                leading: Icon(Icons.local_police),
                title: Text('Attempt Text-to-911 on SOS'),
                onToggle: (value) {
                  setState(() {
                    alertPolice = !alertPolice;
                  });
                },
                initialValue: alertPolice,
              ),
              SettingsTile.switchTile(
                leading: Icon(Icons.verified_user),
                title: Text('Alert nearby users on SOS'),
                onToggle: (value) {
                  setState(() {
                    alertNearby = !alertNearby;
                  });
                },
                initialValue: alertNearby,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
