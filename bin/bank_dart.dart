import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  BankController bankController = BankController();

  bankController.addAccount(
      id: "James Lopes",
      account:
          Account(name: "James Lopes", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "James Lopes", amount: 670);

    if (result) {
      print("Transacao realizada com sucesso");
    }
  } on SenderNotAuthenticatedException catch (e) {
    print("O ${e.idSender} não está autenticado!");
    print(e);
  } on SenderIdInvalidException catch (e) {
    print("O ${e.idSender} não é um ID do remetente válido!");
    print(e);
  } on ReceiverIdInvalidException catch (e) {
    print("O ${e.idReceiver} não é um ID do destinatário válido!");
    print(e);
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(
        "O Saldo do ${e.idSender} é de ${e.balance}, e está tentando transferir ${e.amount}");
    print(e);
  } on Exception {
    print("Algo deu errado");
  }
}
