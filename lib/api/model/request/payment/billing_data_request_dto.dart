class BillingData {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  BillingData({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "email": email,
    "apartment": "NA",
    "floor": "NA",
    "street": "NA",
    "building": "NA",
    "shipping_method": "NA",
    "postal_code": "NA",
    "city": "NA",
    "country": "EG",
    "state": "NA",
  };
}
