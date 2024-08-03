class VoterModel {
  final String regNo;
  final String firmName;
  final String rep1;
  final String mob1;

  VoterModel({
    required this.regNo,
    required this.firmName,
    required this.rep1,
    required this.mob1,
  });

  factory VoterModel.fromJson(Map<String, dynamic> json) {
    return VoterModel(
      regNo: json['regNo'],
      firmName: json['firmName'],
      rep1: json['rep1'],
      mob1: json['mob1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "regNo": regNo,
      "firmName": firmName,
      "rep1": rep1,
      "mob1": mob1,
    };
  }
}
