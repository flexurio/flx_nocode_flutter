import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_group_bloc.freezed.dart';

@freezed
class ProductGroupState with _$ProductGroupState {
  const factory ProductGroupState.initial() = _Initial;
  const factory ProductGroupState.loading() = _Loading;
  const factory ProductGroupState.success() = _Success;
  const factory ProductGroupState.error(String error) = _Error;
}

@freezed
class ProductGroupEvent with _$ProductGroupEvent {
  const factory ProductGroupEvent.create(String id) = _Create;
  const factory ProductGroupEvent.delete(String id) = _Delete;
}

class ProductGroupBloc extends Bloc<ProductGroupEvent, ProductGroupState> {
  ProductGroupBloc() : super(const _Initial()) {
    on<ProductGroupEvent>(
      (event, emit) async {
        await event.when(
          create: (id) async {
            emit(const _Loading());
            try {
              await ProductRepository.instance.productGroupCreate(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(const _Loading());
            try {
              await ProductRepository.instance.productGroupDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
