class Invitation {
  DateTime date;
  String usernameFrom;
  int gameCode;

  Invitation(this.date, this.usernameFrom, this.gameCode);

  Invitation.dummy() {
    date = DateTime.now();
    usernameFrom = 'dummyInviter';
    gameCode = 8888;
  }

  Invitation.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    usernameFrom = json['usernameFrom'];
    gameCode = json['gameCode'];
  }

  Map<String, dynamic> toJson() => {
        'usernameFrom': usernameFrom,
        'gameCode': gameCode,
        'date': date.toIso8601String(),
      };
}
