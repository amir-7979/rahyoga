import 'movement.dart';

class Movements {
  Movements({
    this.count,
    this.next,
    this.previous,
    this.movements,
    this.total,
  });

  late final int? count;
  late final String? next;
  late final String? previous;
  late final List<Movement>? movements;
  late final int? total;

  Movements.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    movements = List.from(json['yoga_movements'])
        .map((e) => Movement.fromJson(e))
        .toList();
    total = json['total'];
  }
}
