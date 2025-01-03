import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_price_bloc.freezed.dart';

@freezed
class ProductPriceState with _$ProductPriceState {
  const factory ProductPriceState.initial() = _Initial;
  const factory ProductPriceState.loading() = _Loading;
  const factory ProductPriceState.success() = _Success;
  const factory ProductPriceState.error(String error) = _Error;
}

@freezed
class ProductPriceEvent with _$ProductPriceEvent {
  const factory ProductPriceEvent.create({
    required int productPrice,
    required DateTime periodStart,
    required int bonusPrice,
    required int primaryPrice,
    required int hppStrip,
    required int stripPrice,
    required int tabletPrice,
    required String idCurrency,
    required String id,
  }) = _Create;

  const factory ProductPriceEvent.edit({
    required Product product,
    required double price,
    required DateTime periodStart,
    required double bonusPrice,
    required double primaryPrice,
    required double hppStrip,
    required double stripPrice,
    required double tabletPrice,
    required Currency currency,
    required ProductPrice productPrice,
  }) = _Edit;

  const factory ProductPriceEvent.delete({
    required ProductPrice productPrice,
    required Product product,
  }) = _Delete;
}

class ProductPriceBloc extends Bloc<ProductPriceEvent, ProductPriceState> {
  ProductPriceBloc() : super(const _Initial()) {
    on<ProductPriceEvent>((event, emit) async {
      await event.when(
        create: (
          productPrice,
          periodStart,
          bonusPrice,
          primaryPrice,
          hppStrip,
          stripPrice,
          tabletPrice,
          idCurrency,
          id,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productPriceCreate(
              accessToken: UserRepositoryApp.instance.token!,
              productPrice: productPrice,
              periodStart: periodStart,
              bonusPrice: bonusPrice,
              primaryPrice: primaryPrice,
              hppStrip: hppStrip,
              stripPrice: stripPrice,
              tabletPrice: tabletPrice,
              idCurrency: idCurrency,
              id: id,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          product,
          price,
          periodStart,
          bonusPrice,
          primaryPrice,
          hppStrip,
          stripPrice,
          tabletPrice,
          currency,
          productPrice,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productPriceEdit(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
              price: price,
              periodStart: periodStart,
              bonusPrice: bonusPrice,
              primaryPrice: primaryPrice,
              hppStrip: hppStrip,
              stripPrice: stripPrice,
              tabletPrice: tabletPrice,
              currency: currency,
              productPrice: productPrice,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (price, product) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productPriceDelete(
              accessToken: UserRepositoryApp.instance.token!,
              price: price,
              product: product,
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
