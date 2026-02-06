class KioskPayResponse {
  final String billReference;

  KioskPayResponse({required this.billReference});

  factory KioskPayResponse.fromJson(Map<String, dynamic> json) {
    return KioskPayResponse(billReference: json['data']['bill_reference']);
  }
}
