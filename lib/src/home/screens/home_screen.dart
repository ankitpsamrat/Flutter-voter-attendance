import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../../auth/models/user_info_model.dart';
import '../../voters/screens/attended_voters.dart';
import '../../voters/screens/pending_voters.dart';
import 'profile_menu.dart';

class HomeScreen extends StatefulWidget {
  final UserInfoModel userInfo;

  const HomeScreen({super.key, required this.userInfo});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //

  late TabController _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Booth no: 32'),
          leading: Visibility(
            visible: widget.userInfo.isAdmin,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu, size: 30),
            ),
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 12 * AppUI.sp,
              fontWeight: FontWeight.bold,
            ),
            // onTap: (value) {
            // setState(() {});

            //   print(value);
            // },
            tabs: [
              Container(
                color: const Color.fromARGB(255, 233, 241, 242),
                width: double.infinity,
                child: const Tab(text: 'Pending'),
              ),
              Container(
                color: const Color.fromARGB(255, 246, 237, 204),
                width: double.infinity,
                child: const Tab(text: 'Attended'),
              ),
            ],
          ),
        ),
        drawer: ProfileMenu(userInfo: widget.userInfo),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PendingVoters(userInfo: widget.userInfo),
            AttendedVoters(userInfo: widget.userInfo),
          ],
        ),
      ),
    );
  }
}
