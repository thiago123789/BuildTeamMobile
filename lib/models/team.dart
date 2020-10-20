import 'package:build_gsd_team/models/client.dart';
import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/primitive_wrapper.dart';

class Team {
  String id;
  String clientId;
  Client client;
  TeamTypeEnum teamType = TeamTypeEnum.Squad;
  TimeZoneConfigEnum timeZoneConfig = TimeZoneConfigEnum.OffShore;
  LocationReferenceEnum locationReferenceEnum =
      LocationReferenceEnum.ClientLocation;
  String customLocation;
  Integer maxCountries;
  Integer maxTeamSize;

  Team(this.teamType, this.timeZoneConfig, this.client, this.maxCountries,
      this.maxTeamSize, this.locationReferenceEnum);

  Team.obj(
      {this.id,
      this.clientId,
      this.teamType,
      this.timeZoneConfig,
      this.client,
      this.maxCountries,
      this.maxTeamSize,
      this.locationReferenceEnum,
      this.customLocation});

  static TeamTypeEnum ToTeamTypeEnum(String valorString) {
    String valor = valorString;
    TeamTypeEnum value = TeamTypeEnum.values
        .firstWhere((element) => element.toFormattedString() == valor);

    return value;
  }

  static TimeZoneConfigEnum ToTimeZoneConfigEnum(String valorString) {
    switch (valorString) {
      case "Off shore":
        return TimeZoneConfigEnum.OffShore;
      case "Near shore":
        return TimeZoneConfigEnum.NearShore;
      default:
        throw new Exception();
    }
  }

  static LocationReferenceEnum ToLocationReferenceEnum(String valor) {
    switch (valor) {
      case "Client":
        return LocationReferenceEnum.ClientLocation;
      case "Office":
        return LocationReferenceEnum.OfficeLocation;
      case "Custom":
        return LocationReferenceEnum.OtherLocation;
      default:
        throw new Exception("Erro no to location reference: ${valor}");
    }
  }

  factory Team.fromJson(Map<String, dynamic> json, Client client, String id) {
    return Team.obj(
        id: id,
        clientId: json['clientId'],
        teamType: ToTeamTypeEnum(json['teamType']),
        timeZoneConfig: ToTimeZoneConfigEnum(json['timezoneConfig']),
        client: client,
        maxCountries: Integer.int(int.parse(json['maxCountries'])),
        maxTeamSize: Integer.int(int.parse(json['maxTeamSize'])),
        locationReferenceEnum:
            ToLocationReferenceEnum(json['locationReference']),
        customLocation: json['customLocation']);
  }
}
