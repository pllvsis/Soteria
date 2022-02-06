import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class EmergencyContactSettingsPage extends StatefulWidget {
  const EmergencyContactSettingsPage({Key? key}) : super(key: key);

  @override
  _EmergencyContactSettingsState createState() =>
      _EmergencyContactSettingsState();
}

class _EmergencyContactSettingsState
    extends State<EmergencyContactSettingsPage> {
  PhoneContact? primaryContact;
  PhoneContact? secondaryContact;
  PhoneContact? tertiaryContact;

  SettingsTile _contactCard(
      {title, description = "", contact = Null, function}) {
    return SettingsTile(
      title: contact == null ? Text(title) : Text(contact.fullName),
      description: contact == null
          ? Text(description)
          : Text((contact.phoneNumber.number).toString()),
      onPressed: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Contacts')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            _contactCard(
              title: "Contact 1",
              description:
                  "The primary contact is the first contact that will be contacted in case of an emergency.",
              contact: primaryContact,
              function: (context) async {
                PhoneContact? contact;
                try {
                  contact = await FlutterContactPicker.pickPhoneContact();
                } catch (e) {
                  if (primaryContact == null) {
                    contact = null;
                  }
                } finally {
                  setState(() {
                    primaryContact = contact;
                  });
                }
              },
            ),
            _contactCard(
              title: "Contact 2",
              contact: secondaryContact,
              function: (context) async {
                PhoneContact? contact;
                try {
                  contact = await FlutterContactPicker.pickPhoneContact();
                } catch (e) {
                  if (secondaryContact == null) {
                    contact = null;
                  }
                } finally {
                  setState(() {
                    secondaryContact = contact;
                  });
                }
              },
            ),
            _contactCard(
              title: "Contact 3",
              contact: tertiaryContact,
              function: (context) async {
                PhoneContact? contact;
                try {
                  contact = await FlutterContactPicker.pickPhoneContact();
                } catch (e) {
                  if (tertiaryContact == null) {
                    contact = null;
                  }
                } finally {
                  setState(() {
                    tertiaryContact = contact;
                  });
                }
              },
            ),
          ]),
        ],
      ),
    );
  }
}
