import 'dart:collection';
import 'package:duka/core/utilities/constants.dart';
import 'package:duka/core/models/wallet_model.dart';
import 'package:stacked/stacked.dart';

class WalletViewModel extends BaseViewModel {
  final List<WalletModel> _walletModels = [
    WalletModel(
      title: 'Debited',
      dateTime: '20220418 19:20',
      price: 5101,
      balance: 210210.05,
      debit: true,
    ),
    WalletModel(
      title: 'Wallet deposit',
      dateTime: '20220417 23:20',
      price: 15101,
      balance: 215311.05,
      debit: false,
    ),
    WalletModel(
      title: '2x Bucket chicken and chips',
      dateTime: '20220410 14:43',
      price: 9567.77,
      balance: 200210.05,
      debit: true,
    ),
    WalletModel(
      title: '2x Bucket chicken and chips',
      dateTime: '20220409 10:00',
      price: 9567.77,
      balance: 209777.82,
      debit: true,
    ),
  ];

  UnmodifiableListView<WalletModel> get walletModelList {
    _walletModels.sort((a, b) => DateTime.parse(b.dateTime)
        .millisecondsSinceEpoch
        .compareTo(DateTime.parse(a.dateTime).millisecondsSinceEpoch));
    return UnmodifiableListView(_walletModels);
  }

  String get walletBalance {
    return kNumberFormat.format(walletModelList.first.balance);
  }
}
