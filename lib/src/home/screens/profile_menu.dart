import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/assets.dart';
import '../../../helpers/navigation.dart';
import '../../../helpers/responsive.dart';
import '../../../utils/common_utils.dart';
import '../../auth/models/user_info_model.dart';
import '../../auth/screens/login_screen.dart';
import '../../client/screens/upload_file.dart';
import '../../client/screens/user_access.dart';
import '../../common/custom_popup.dart';

class ProfileMenu extends StatelessWidget {
  final UserInfoModel userInfo;

  const ProfileMenu({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // decoration: BoxDecoration(
            //   color: AppColors.orange.withOpacity(0.8),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Image.asset(
                  AppImgs.userIcon,
                  height: 6 * AppUI.dh,
                ),
                const Spacer(),
                Text(
                  '${userInfo.firstName} ${userInfo.lastName}',
                  style: TextStyle(
                    fontSize: 12 * AppUI.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userInfo.phoneNumber,
                  style: TextStyle(
                    fontSize: 10 * AppUI.sp,
                  ),
                ),
                Text(
                  userInfo.email,
                  style: TextStyle(
                    fontSize: 10 * AppUI.sp,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy_outlined),
            title: const Text('Upload & Download'),
            onTap: () {
              // Navigation.navigatorKey.currentState!.pop();

              Navigation.navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const UploadFile(),
                ),
              );

              // showModalBottomSheet(
              //   context: context,
              //   // isScrollControlled: true,
              //   builder: (context) {
              //     return const UploadFile();
              //   },
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('User access'),
            onTap: () {
              Navigation.navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const UserAccess(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.download_outlined),
          //   title: const Text('Download attendance'),
          //   onTap: () {
          //     // Navigation.navigatorKey.currentState!.push(
          //     //   MaterialPageRoute(
          //     //     builder: (context) => const AboutApp(),
          //     //   ),
          //     // );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About app'),
            onTap: () {
              // Navigation.navigatorKey.currentState!.push(
              //   MaterialPageRoute(
              //     builder: (context) => const AboutApp(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text('Feedback'),
            onTap: () {
              // Navigation.navigatorKey.currentState!.pop();

              // showModalBottomSheet(
              //   context: context,
              //   isScrollControlled: true,
              //   builder: (context) {
              //     return FeedbackForm(userInfo: userInfo);
              //   },
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Share'),
            onTap: () async {
              try {
                await Share.share(
                  'Hey! check out this App:\nhttps://shorturl.at/U7Znf',
                );
              } catch (e) {
                debugPrint('Unable to share app link: $e');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Contact us'),
            onTap: () {
              CommonUtils.launchEmail(email: userInfo.clientEmail);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              customPopUp(
                title: 'Are your sure you want to logout?',
                primaryAction: () {
                  Navigation.navigatorKey.currentState!.pop();

                  Navigation.navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text('App version: 0.0.02'),
          ),
        ],
      ),
    );
  }
}
