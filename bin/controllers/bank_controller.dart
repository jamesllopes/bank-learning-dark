import '../exceptions/bank_controller_exceptions.dart';
import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    if (!verifyId(idSender)) {
      throw SenderIdInvalidException(idSender: idSender);
    }

    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidException(idReceiver: idReceiver);
    }
    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    if (accountSender.balance < amount) {
      throw SenderBalanceLowerThanAmountException(
          idSender: idSender, amount: amount, balance: accountSender.balance);
    }

    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticatedException(idSender: idSender);
    }

    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
