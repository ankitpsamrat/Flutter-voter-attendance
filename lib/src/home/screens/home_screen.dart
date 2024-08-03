import 'package:flutter/material.dart';

import 'package:votar_attendance/helpers/responsive.dart';
import 'package:votar_attendance/src/voters/screens/attended_voters.dart';
import 'package:votar_attendance/src/voters/screens/pending_voters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //

  late TabController _tabController;

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Dashboard'),
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
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PendingVoters(),
            AttendedVoters(),
          ],
        ),
      ),
    );
  }
}
