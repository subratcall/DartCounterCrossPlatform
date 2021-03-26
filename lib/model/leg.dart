import 'package:dart_counter/model/throw.dart';

class Leg {
  final List<Throw> throws;

  Leg({this.throws});

  Leg.fromJson(Map<String, dynamic> json)
      : throws = json['throws'] != null
            ? json['throws']
                .map((value) => Throw.fromJson(value))
                .cast<Throw>()
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'throws':
            throws != null ? throws.map((t) => t.toJson()).toList() : null,
      };
}
