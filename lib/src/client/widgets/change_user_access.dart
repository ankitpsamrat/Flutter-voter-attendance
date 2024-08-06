import 'package:flutter/material.dart';

import '../../common/custom_button.dart';

class ChangeUserAccess extends StatelessWidget {
  const ChangeUserAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change User Access'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Username'),
          const Text('Name'),
          ListTile(
            title: const Text('Admin access'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          // if admin access is true then login access should not be visible
          ListTile(
            title: const Text('Login access'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          // if any one action is true then show drop drown to select booth no.
          // feature: user can select multiple booth no.

          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              title: 'Submit',
              onTap: () async {
                // implement logic here
              },
            ),
          )
        ],
      ),
    );
  }
}
