enum TimeZoneConfigEnum { OffShore, NearShore }

enum TeamTypeEnum { Squad, DAD, AGSD, Safe, Nexus }

enum LocationReferenceEnum { ClientLocation, OfficeLocation, OtherLocation }

extension ParseToStringTimeZone on TimeZoneConfigEnum {
  String toFormattedString() {
    switch (this) {
      case TimeZoneConfigEnum.OffShore:
        return "Off shore";
      case TimeZoneConfigEnum.NearShore:
        return "Near shore";
      default:
        Exception();
    }
  }
}

extension ParseToStringLocation on LocationReferenceEnum {
  String toFormattedString() {
    switch (this) {
      case LocationReferenceEnum.ClientLocation:
        return "Client";
      case LocationReferenceEnum.OfficeLocation:
        return "Office";
      case LocationReferenceEnum.OtherLocation:
        return "Custom";
      default:
        Exception();
    }
  }
}

extension ParseToStringTeamType on TeamTypeEnum {
  String toFormattedString() {
    return this.toString().split(".").last;
  }
}

extension ParseToTeamTypeEnum on String {
  TeamTypeEnum toTeamTypeEnum() {
    TeamTypeEnum value = TeamTypeEnum.values
        .firstWhere((element) => element.toFormattedString() == this);

    return value;
  }
}
