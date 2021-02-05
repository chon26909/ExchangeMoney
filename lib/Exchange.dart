// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.rates,
    this.base,
    this.date,
  });

  Map<String, double> rates;
  String base;
  DateTime date;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        rates: json["rates"] == null
            ? null
            : Map.from(json["rates"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        base: json["base"] == null ? null : json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "rates": rates == null
            ? null
            : Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "base": base == null ? null : base,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
