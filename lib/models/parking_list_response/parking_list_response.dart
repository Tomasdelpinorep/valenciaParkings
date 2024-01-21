import 'result.dart';

class ParkingListResponse {
  num? totalCount;
  List<Result>? results;

  ParkingListResponse({this.totalCount, this.results});

  factory ParkingListResponse.fromJson(Map<String, dynamic> json) {
    return ParkingListResponse(
      totalCount: json['total_count'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
