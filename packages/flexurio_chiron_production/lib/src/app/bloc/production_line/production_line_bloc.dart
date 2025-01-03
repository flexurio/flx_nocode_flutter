import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_line_bloc.freezed.dart';

@freezed
class ProductionLineState with _$ProductionLineState {
  const factory ProductionLineState.initial() = _Initial;
  const factory ProductionLineState.loading() = _Loading;
  const factory ProductionLineState.success() = _Success;
  const factory ProductionLineState.error(String error) = _Error;
}

@freezed
class ProductionLineEvent with _$ProductionLineEvent {
  const factory ProductionLineEvent.create(String name) = _Create;
  const factory ProductionLineEvent.update(int id, String name) = _Update;
  const factory ProductionLineEvent.delete(int id) = _Delete;
}

class ProductionLineBloc
    extends Bloc<ProductionLineEvent, ProductionLineState> {
  ProductionLineBloc() : super(const _Initial()) {
    on<ProductionLineEvent>((event, emit) async {
      await event.when(
        create: (name) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.lineCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.lineUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.lineDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
