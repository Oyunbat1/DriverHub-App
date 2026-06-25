import 'package:get/get.dart';


class MockDataService extends GetxService {
  Future<List<Map<String, dynamic>>> fetchOrders() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'id': '101',
        'title': 'Airport pickup',
        'from': 'Downtown',
        'to': 'Airport',
        'price': 25000,
      },
      <String, dynamic>{
        'id': '102',
        'title': 'Grocery run',
        'from': 'Sky Mart',
        'to': 'Zaisan',
        'price': 12000,
      },
      <String, dynamic>{
        'id': '103',
        'title': 'Office transfer',
        'from': 'Blue Sky',
        'to': 'UB Tower',
        'price': 8000,
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchHistory() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'id': '9001',
        'title': 'Airport pickup',
        'date': '2026-06-20',
        'price': 25000,
        'status': 'completed',
      },
      <String, dynamic>{
        'id': '9002',
        'title': 'Night ride',
        'date': '2026-06-19',
        'price': 18000,
        'status': 'completed',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchNotifications() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'n1',
        'title': 'New order nearby',
        'body': 'An order is available 2km away.',
        'time': '10:24',
      },
      <String, dynamic>{
        'id': 'n2',
        'title': 'Payment received',
        'body': 'You earned 25,000 from your last trip.',
        'time': '09:10',
      },
    ];
  }
}
