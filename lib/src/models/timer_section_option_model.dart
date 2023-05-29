class TimerSelectionOptions {
  String? ringtone;
  double? volume;
  bool? vibration;

  TimerSelectionOptions(this.ringtone, this.volume, this.vibration);

  TimerSelectionOptions.fromJson(Map<String, dynamic> json)
      : ringtone = json['ringtone'] ?? "",
        volume = json['volume'] ?? 0,
        vibration = json['vibration'] ?? false;

  Map<String, dynamic> toJson() {
    return {
      'ringtone': ringtone,
      'volume': volume,
      'vibration': vibration,
    };
  }
}
