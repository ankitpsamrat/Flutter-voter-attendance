import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../../helpers/responsive.dart';
import '../../auth/models/user_info_model.dart';
import '../../common/custom_snackbar.dart';
import '../models/pending_voter_model.dart';

class PendingVoters extends StatefulWidget {
  final UserInfoModel userInfo;

  const PendingVoters({super.key, required this.userInfo});

  @override
  State<PendingVoters> createState() => _PendingVotersState();
}

class _PendingVotersState extends State<PendingVoters> {
  //

  late Future<List<VoterModel>> _pendingVoters;

  Future<List<VoterModel>> _fetchPendingVoters() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://166.0.242.94:80/voterattendence/excelrows/boothNo/booth223/hasVoted/false'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        return List<VoterModel>.from(
          jsonResponse.map((model) => VoterModel.fromJson(model)),
        );
      } else {
        throw Exception('Failed to load pending voters');
      }
    } catch (e) {
      debugPrint('Unable to fetch pending voters: $e');
      return [];
    }
  }

  Future<void> _updatePenddingVoters({required String regNo}) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://166.0.242.94:80/voterattendence/excelrows/userId/${widget.userInfo.userId}/regNo/$regNo/hasVoted/true'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        CustomSnackbar.showSnackbar(
          msg: 'Marked attended!',
          duration: const Duration(seconds: 1),
        );
      } else {
        CustomSnackbar.showSnackbar(
          msg: 'Failed to voter pendding',
          bgColor: AppColors.red,
          duration: const Duration(seconds: 1),
        );
        throw Exception('Failed to voter pendding');
      }
    } catch (e) {
      debugPrint('Unable to voter pendding: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    _pendingVoters = _fetchPendingVoters();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 233, 241, 242),
      child: FutureBuilder(
        future: _pendingVoters,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            debugPrint('Unable to fetch pending voters: ${snapshot.error}');
            return const Text('Oops... Unable to fetch pending voters.');
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final VoterModel voter = snapshot.data[index];

                return Dismissible(
                  key: Key(voter.regNo.toString()),
                  background: Container(color: AppColors.white),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (_) async {
                    await _updatePenddingVoters(regNo: voter.regNo);

                    setState(() {
                      snapshot.data.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 4 * AppUI.dw),
                    title: Text(
                      '${voter.firmName} (${voter.regNo})',
                      style: TextStyle(
                        fontSize: 10 * AppUI.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '${voter.rep1} ${(voter.mob1.isEmpty) ? '' : "(${voter.mob1})"}',
                      style: TextStyle(
                        fontSize: 9 * AppUI.sp,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'Oops... You have no pending voters at the moment.',
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
