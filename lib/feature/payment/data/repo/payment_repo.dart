
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// import '../../../cart/data/models/billing.dart';


// class PaymentRepo {
//   Future<Either<String, String>> payWithPayMob(double amount,Billing billing) async {



    
//     try {
//       String token = await getToken();
//       int orderId = await getOrderId(amount: (amount*100).toString(), token: token);
//       String paymentKey = await getPaymentKey(
//         billing: billing,
//           orderId: orderId.toString(), token: token, amount: (amount*100).toString());
//       return right(paymentKey);
     
//     } catch (e) {
//       print(e.toString());
//       return left(e.toString());
//     }
//   }

//   Future<String> getToken() async {
//     try {
//       Response response =
//           await Dio().post('https://accept.paymob.com/api/auth/tokens', data: {
//         "api_key":
//             "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBeU1qZzJNQ3dpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS50TXdHSzc5VC1FQkUyN1VpcWd0NTNmYjJzeWxGVlBpT2VDYjRTd3FsVnhqaGgxNTVtVVlzYVNNWkFaOHlCM3gydlB3RDZUYXgtYlp0bUMtWEN1d2c5QQ=="
//       });
//       print('auth token${response.data['token']}');
      
//       return response.data['token'];
//     } catch (e) {
//       print(e.toString());

//       rethrow;
//     }
//   }

//   Future<int> getOrderId(
//       {required String amount, required String token}) async {
//     try {
//       Response response = await Dio().post(
//           'https://accept.paymob.com/api/ecommerce/orders',
//           data: {"auth_token": token, "amount_cents": amount});
//       print('auth token${response.data['id']}');
//       return response.data['id'];
//     } catch (e) {
//       print(e.toString());

//       rethrow;
//     }
//   }

//   Future<String> getPaymentKey(
//       {required String orderId,
//       required String token,
//       required String amount,
//         required Billing billing
//       }) async {
//     try {
//       Response response = await Dio()
//           .post('https://accept.paymob.com/api/acceptance/payment_keys', data: {
//         "auth_token": token,
//         "order_id": orderId,
//         "amount_cents": amount,
//         "currency": "EGP",
//         "integration_id": 4949210,
//         "billing_data": {
//           "apartment": "dumy",
//           "first_name": billing.firstName,
//           "last_name": billing.lastName,
//           "street": "dumy",
//           "building": "dumy",
//           "phone_number": billing.phone,
//           "city": billing.city,
//           "country": "dumy",
//           "email": billing.email,
//           "floor": "dumy",
//           "state": "dumy"
//         }
//       });
//       print('payment key${response.data['token']}');
//       return response.data['token'];
//     } catch (e) {
//       print(e.toString());

//       rethrow;
//     }
//   }
// }
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentRepo {
  final InAppPurchase _iap = InAppPurchase.instance;

  Future<Either<String, PurchaseDetails>> payWithInAppPurchase(String productId) async {
    try {
      // Check availability
      final bool available = await _iap.isAvailable();
      if (!available) return left('In-App Purchases not available');

      // Get product details from App Store
      final ProductDetailsResponse response = await _iap.queryProductDetails({productId});
      if (response.notFoundIDs.isNotEmpty) {
        return left('Product not found: $productId');
      }

      final productDetails = response.productDetails.first;

      // Start the purchase
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
      _iap.buyNonConsumable(purchaseParam: purchaseParam);

      // Listen for purchase updates (in your app’s BLoC or main screen)
      // This is just a placeholder, should be handled outside and stored
      final purchase = await _waitForPurchase(productId);
      if (purchase != null && purchase.status == PurchaseStatus.purchased) {
        return right(purchase);
      } else {
        return left('Purchase failed or cancelled');
      }
    } catch (e) {
      print('Error: $e');
      return left(e.toString());
    }
  }

  /// Mockup: Waits for a specific purchase to complete (should be replaced with your own listener logic)
  Future<PurchaseDetails?> _waitForPurchase(String productId) async {
    final completer = Completer<PurchaseDetails?>();

    final Stream<List<PurchaseDetails>> purchaseUpdated = InAppPurchase.instance.purchaseStream;
    final subscription = purchaseUpdated.listen((purchases) {
      for (final purchase in purchases) {
        if (purchase.productID == productId && purchase.status == PurchaseStatus.purchased) {
          completer.complete(purchase);
          break;
        }
      }
    });

    final result = await completer.future.timeout(Duration(seconds: 30), onTimeout: () {
      subscription.cancel();
      return null;
    });

    subscription.cancel();
    return result;
  }
}
