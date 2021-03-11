import 'package:dart_counter/model/throw.dart';

class Leg {
  List<Throw> throws;

  Leg(this.throws);

  Leg.dummy() : throws = [Throw.dummy(), Throw.dummy(), Throw.dummy()];

  Leg.fromJson(Map<String, dynamic> json) {
    throws = json['throws'] != null ? json['throws'].map((value) => Throw.fromJson(value)).toList() : null;
  }

  Map<String, dynamic> toJson() => {
        'throws': throws != null ? throws.map((t) => t.toJson()).toList() : null,
      };
}
