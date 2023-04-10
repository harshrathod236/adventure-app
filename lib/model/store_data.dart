class StoreData {
  String? photoUrl;
  String? placeName;
  String? locationName;
  String? date;
  String? fullName;
  String? fromAddress;
  String? toAddress;
  StoreData({
    this.photoUrl,
    this.placeName,
    this.locationName,
    this.date,
    this.fullName,
    this.fromAddress,
    this.toAddress,
  });
}

class ListOfStoredData {
  static List<StoreData> listOfData = [];
}

class FurtherData {
  static String? photoUrl;
  static String? placeName;
  static String? locationName;
  static String? date;
}
