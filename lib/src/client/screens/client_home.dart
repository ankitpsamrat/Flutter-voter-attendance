import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../../common/custom_button.dart';

class ClientHome extends StatelessWidget {
  const ClientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Client Home'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                title: 'Upload file',
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: CustomButton(
                  title: 'User access',
                  onTap: () {},
                ),
              ),
              CustomButton(
                title: 'Download attendance',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
