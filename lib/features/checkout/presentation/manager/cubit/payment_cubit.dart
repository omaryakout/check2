import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/repos/check_out_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkOutRepo}) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  void makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var result = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
      (failures) => emit(PaymentFailure(errMessage: failures.errMessage)),
      (r) {
        emit(PaymentSucess());
      },
    );
  }


}
