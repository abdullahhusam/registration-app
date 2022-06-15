class UserFields {
  static final String id = 'id';
  static final String first_name = 'first_name';
  static final String last_name = 'last_name';
  static final String address = 'address';
  static final String area = 'area';
  static final String landline = 'landline';
  static final String mobile = 'mobile';
  static final String frontId = 'frontId';
  static final String backId = 'backId';

  static List<String> getFields() => [
        id,
        first_name,
        last_name,
        address,
        area,
        landline,
        mobile,
        frontId,
        backId
      ];
}

class User {
  final int? id;
  final String first_name;
  final String last_name;
  final String address;
  final String area;
  final String landline;
  final String mobile;
  final String frontId;
  final String backId;

  const User(
      {this.id,
      required this.first_name,
      required this.last_name,
      required this.address,
      required this.area,
      required this.landline,
      required this.mobile,
      required this.frontId,
      required this.backId});

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.first_name: first_name,
        UserFields.last_name: last_name,
        UserFields.address: address,
        UserFields.area: area,
        UserFields.landline: landline,
        UserFields.mobile: mobile,
        UserFields.frontId: frontId,
        UserFields.backId: backId
      };
}
