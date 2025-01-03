import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTransactionBloc extends Bloc<List<Transaction>, List<Transaction>> {
  ListTransactionBloc() : super([]) {
    on<List<Transaction>>((event, emit) {
      emit(List.from(event));
    });
  }
}
