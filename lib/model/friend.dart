class Friend {
  String username;

  Friend(this.username);

  Friend.dummy() {
    username = 'dummyFriend';
  }

  Friend.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
