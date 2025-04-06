import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/schedule_entity.freezed.dart';
part 'generated/schedule_entity.g.dart';

@freezed
class ScheduleEntity with _$ScheduleEntity {
  const ScheduleEntity._();

  const factory ScheduleEntity({
    required String id,
    required String day,
    required int duration,
    required String time,
  }) = _ScheduleEntity;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);

  factory ScheduleEntity.fromJsonWithId(Map<String, dynamic> json) {
    final jsonCopy = Map<String, dynamic>.from(json);
    jsonCopy['id'] ??= const Uuid().v4();
    return _$ScheduleEntityFromJson(jsonCopy);
  }

  List<int> get scheduleDays {
    return day.split(',').map((e) => int.parse(e)).toList();
  }

  DateTime get startTime {
    final timeParts = time.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    return DateTime(0, 0, 0, hour, minute);
  }

  Map<String, dynamic> toJsonWithoutId() {
    final jsonCopy = Map<String, dynamic>.from(toJson());
    jsonCopy.remove('id');
    return jsonCopy;
  }
}
