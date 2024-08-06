import 'package:flutter/material.dart';
import 'package:votar_attendance/helpers/navigation.dart';
import 'package:votar_attendance/helpers/responsive.dart';
import 'package:votar_attendance/src/client/widgets/change_user_access.dart';

class UserAccess extends StatelessWidget {
  const UserAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Access'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: const Text('Username'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                Text('Status: Active/inactive'),
              ],
            ),
            contentPadding: EdgeInsets.only(left: 5 * AppUI.dw),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
            ),
            onTap: () {
              Navigation.navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const ChangeUserAccess(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
