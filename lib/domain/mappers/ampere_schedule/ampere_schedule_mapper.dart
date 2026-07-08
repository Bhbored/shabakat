import 'package:shabakat/core/network/dto/request/ampere_schedule/create_ampere_schedule_request.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/update_ampere_schedule_request.dart';
import 'package:shabakat/core/network/dto/response/ampere_schedule/ampere_schedule_response.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';

extension AmpereScheduleResponseMapper on AmpereScheduleResponse {
  AmpereSchedule toEntity() => AmpereSchedule(
    id: id,
    name: name,
    hoursPerDay: hoursPerDay,
    pricePerAmp: pricePerAmp,
    customerCount: customerCount,
    createdAt: createdAt,
  );
}

extension AmpereScheduleMapper on AmpereSchedule {
  CreateAmpereScheduleRequest toCreateRequest() => CreateAmpereScheduleRequest(
    name: name,
    hoursPerDay: hoursPerDay,
    pricePerAmp: pricePerAmp,
  );

  UpdateAmpereScheduleRequest toUpdateRequest() => UpdateAmpereScheduleRequest(
    name: name,
    hoursPerDay: hoursPerDay,
    pricePerAmp: pricePerAmp,
  );
}
