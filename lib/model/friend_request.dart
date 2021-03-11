class FriendRequest {
  DateTime date;
  String usernameFrom;

  FriendRequest(this.date, this.usernameFrom);

  FriendRequest.dummy() {
    date = DateTime.now();
    usernameFrom = 'dummyFriend';
  }

  FriendRequest.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    usernameFrom = json['usernameFrom'];
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'usernameFrom': usernameFrom,
      };
}
