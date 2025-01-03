import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'transaction_routine_bloc.freezed.dart';

@freezed
class TransactionRoutineState with _$TransactionRoutineState {
  factory TransactionRoutineState.initial({
    TransactionRoutineHeader? transactionRoutineHeader,
    List<TransactionRoutineDetail>? transactionRoutineDetail,
  }) = _Initial;
  factory TransactionRoutineState.loading() = _Loading;
  factory TransactionRoutineState.success() = _Success;
  factory TransactionRoutineState.error({required String error}) = _Error;
}

@freezed
class TransactionRoutineEvent with _$TransactionRoutineEvent {
  const factory TransactionRoutineEvent.createHeader({
    TransactionRoutineHeader? transactionRoutineHeader,
  }) = _CreateHeader;
  const factory TransactionRoutineEvent.createDetail({
    TransactionRoutineDetail? newTransactionRoutineDetail,
  }) = _CreateDetail;
  const factory TransactionRoutineEvent.remove(String unique) = _Remove;
  const factory TransactionRoutineEvent.create({
    TransactionRoutineHeader? transactionRoutineHeader,
    List<TransactionRoutineDetail>? transactionRoutineDetail,
  }) = _Create;
  const factory TransactionRoutineEvent.delete({
    required TransactionRoutine transactionRoutine,
  }) = _Delete;
}

class TransactionRoutineBloc
    extends Bloc<TransactionRoutineEvent, TransactionRoutineState> {
  TransactionRoutineBloc() : super(_Initial(transactionRoutineDetail: [])) {
    on<TransactionRoutineEvent>(
      (event, emit) async {
        await event.when(
          create: (
            transactionRoutineHeader,
            transactionRoutineDetail,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.transactionRoutineCreate(
                accessToken: UserRepositoryApp.instance.token!,
                transactionRoutineHeader: _transactionRoutineHeader!,
                transactionRoutineDetail: transactionRoutineDetail!,
              );

              emit(_Success());
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
          createHeader: (
            transactionRoutineHeader,
          ) async {
            _transactionRoutineHeader = transactionRoutineHeader;
            emit(
              _Initial(
                transactionRoutineHeader: _transactionRoutineHeader,
                transactionRoutineDetail: _transactionRoutineDetail,
              ),
            );
          },
          createDetail: (
            newTransactionDetail,
          ) async {
            final newState =
                List<TransactionRoutineDetail>.from(_transactionRoutineDetail!);

            final indexExists = newState.indexWhere(
              (element) => element.unique == newTransactionDetail!.unique,
            );

            if (indexExists > -1) {
              newState.removeAt(indexExists);
            }

            newState.add(newTransactionDetail!);
            _transactionRoutineDetail = newState;
            emit(
              _Initial(
                transactionRoutineHeader: _transactionRoutineHeader,
                transactionRoutineDetail: newState,
              ),
            );
          },
          remove: (unique) {
            final newState =
                List<TransactionRoutineDetail>.from(_transactionRoutineDetail!)
                  ..removeWhere((element) => element.unique == unique);
            _transactionRoutineDetail = newState;
            emit(
              _Initial(
                transactionRoutineHeader: _transactionRoutineHeader,
                transactionRoutineDetail: newState,
              ),
            );
          },
          delete: (transactionRoutine) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.transactionRoutineDelete(
                transactionRoutine: transactionRoutine,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
        );
      },
    );
  }
  TransactionRoutineHeader? _transactionRoutineHeader;
  List<TransactionRoutineDetail>? _transactionRoutineDetail = [];
}
