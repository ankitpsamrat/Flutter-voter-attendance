import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:votar_attendance/constants/colors.dart';

import 'package:votar_attendance/src/voters/models/pending_voter_model.dart';

class AttendedVoters extends StatefulWidget {
  const AttendedVoters({super.key});

  @override
  State<AttendedVoters> createState() => _AttendedVotersState();
}

class _AttendedVotersState extends State<AttendedVoters> {
  //

  late Future<List<VoterModel>> _attendedVoters;

  Future<List<VoterModel>> _fetchAttendedVoters() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://166.0.242.94:80/voterattendence/excelrows/boothNo/booth223/hasVoted/true'),
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
        throw Exception('Failed to load attended voters');
      }
    } catch (e) {
      debugPrint('Unable to fetch attended voters: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();

    _attendedVoters = _fetchAttendedVoters();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 246, 237, 204),
      child: FutureBuilder(
        future: _attendedVoters,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            debugPrint('Unable to fetch attended voters: ${snapshot.error}');
            return const Text('Oops... Unable to fetch attended voters.');
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final VoterModel voter = snapshot.data[index];

                return Dismissible(
                  key: Key(voter.regNo.toString()),
                  background: Container(color: AppColors.white),
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(voter.firmName),
                    subtitle: Text(voter.rep1),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'Oops... You have no attended voters at the moment.',
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
