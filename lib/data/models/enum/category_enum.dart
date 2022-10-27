// ignore: constant_identifier_names
enum CategoryEnum { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

final categoryValues = EnumValues({
  "electronics": CategoryEnum.ELECTRONICS,
  "jewelery": CategoryEnum.JEWELERY,
  "men's clothing": CategoryEnum.MEN_S_CLOTHING,
  "women's clothing": CategoryEnum.WOMEN_S_CLOTHING
});
