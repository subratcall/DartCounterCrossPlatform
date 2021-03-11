import 'package:dart_counter/model/leg.dart';

class Set {
  List<Leg> legs;

  Set(this.legs);

  Set.dummy() : legs = [Leg.dummy(), Leg.dummy(), Leg.dummy()];

  Set.fromJson(Map<String, dynamic> json) {
    legs = json['legs'] != null ? json['legs'].map((value) => Leg.fromJson(value)).cast<Leg>().toList() : null;
  }

  Map<String, dynamic> toJson() => {
        'legs': legs != null ? legs.map((leg) => leg.toJson()).toList() : null,
      };
}
