import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/field_force_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'field_force_summary_detail_query_bloc.freezed.dart';

@freezed
class FieldForceSummaryDetailQueryState
    with _$FieldForceSummaryDetailQueryState {
  const factory FieldForceSummaryDetailQueryState.initial() = _Initial;
  const factory FieldForceSummaryDetailQueryState.loading() = _Loading;
  const factory FieldForceSummaryDetailQueryState.loaded(
    List<FieldForceSummaryWithDelta>? product,
    List<FieldForceSummaryWithDelta>? outlet,
    List<FieldForceSummaryWithDelta>? customer,
    DateTime period,
  ) = _Loaded;
  const factory FieldForceSummaryDetailQueryState.error(String error) = _Error;
}

@freezed
class FieldForceSummaryDetailQueryEvent
    with _$FieldForceSummaryDetailQueryEvent {
  const factory FieldForceSummaryDetailQueryEvent.fetch({
    required String areaCode,
    required DateTime period,
    required FieldForceSummaryCategory category,
    required FieldForceSummaryFilter filter,
  }) = _Fetch;
}

class FieldForceSummaryDetailQueryBloc extends Bloc<
    FieldForceSummaryDetailQueryEvent, FieldForceSummaryDetailQueryState> {
  FieldForceSummaryDetailQueryBloc() : super(const _Initial()) {
    on<FieldForceSummaryDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (areaCode, period, category, filter) async {
          emit(const _Loading());
          try {
            final (outlets, customers, products) =
                await _summaryFieldForceDetailDetail(
              category: category,
              filter: filter,
              dateTime: period,
              areaCode: areaCode,
            );

            emit(_Loaded(products, outlets, customers, period));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}

class FieldForceSummaryFilter {
  FieldForceSummaryFilter({
    this.outlet,
    this.customer,
    this.product,
  });
  final String? outlet;
  final String? customer;
  final String? product;

  FieldForceSummaryFilter copyWith({
    String? outlet,
    String? customer,
    String? product,
  }) {
    return FieldForceSummaryFilter(
      outlet: outlet ?? this.outlet,
      customer: customer ?? this.customer,
      product: product ?? this.product,
    );
  }

  (
    FieldForceSummaryCategorySub categorySub,
    String? flag1,
    String? flag2,
    String? flag3,
  ) get categorySub {
    if (customer != null && outlet != null) {
      return (
        FieldForceSummaryCategorySub.customerOutlet,
        customer,
        outlet,
        null
      );
    } else if (customer != null && product != null) {
      return (
        FieldForceSummaryCategorySub.customerProduct,
        customer,
        product,
        null,
      );
    } else if (outlet != null && product != null) {
      return (
        FieldForceSummaryCategorySub.customerOutletProduct,
        outlet,
        product,
        null,
      );
    } else if (customer != null) {
      return (FieldForceSummaryCategorySub.customer, customer, null, null);
    } else if (outlet != null) {
      return (FieldForceSummaryCategorySub.outlet, outlet, null, null);
    } else if (product != null) {
      return (FieldForceSummaryCategorySub.product, product, null, null);
    } else {
      return (FieldForceSummaryCategorySub.all, null, null, null);
    }
  }
}

Future<
    (
      List<FieldForceSummaryWithDelta>? outlet,
      List<FieldForceSummaryWithDelta>? customer,
      List<FieldForceSummaryWithDelta>? product
    )> _summaryFieldForceDetailDetail({
  required FieldForceSummaryCategory category,
  required FieldForceSummaryFilter filter,
  required DateTime dateTime,
  required String areaCode,
}) async {
  List<FieldForceSummary>? outlets;
  List<FieldForceSummary>? customers;
  List<FieldForceSummary>? products;

  final now = DateTime.now();
  final n1 = DateTime(now.year, now.month - 1, now.day);
  final n2 = DateTime(now.year, now.month - 2, now.day);
  final n3 = DateTime(now.year, now.month - 3, now.day);
  final customersWithDelta = <FieldForceSummaryWithDelta>[];
  final outletsWithDelta = <FieldForceSummaryWithDelta>[];
  final productsWithDelta = <FieldForceSummaryWithDelta>[];

  Future<List<FieldForceSummaryWithDelta>> getDelta(
    List<FieldForceSummary> data,
    FieldForceSummaryCategorySub categorySub,
  ) async {
    final summaryWithDelta = <FieldForceSummaryWithDelta>[];

    final id = data
        .map((e) {
          if (categorySub == FieldForceSummaryCategorySub.customer) {
            final (id, _) = e.customer;
            return id;
          } else if (categorySub == FieldForceSummaryCategorySub.outlet) {
            final (id, _) = e.outlet;
            return id;
          } else if (categorySub == FieldForceSummaryCategorySub.product) {
            final (id, _) = e.product;
            return id;
          }
        })
        .toList()
        .join(',');

    final summaryDelta = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: n1,
      dateStart: n3,
      categorySub: 'DELTA-${categorySub.value}',
      flag1: id,
    );

    for (var i = 0; i < data.length; i++) {
      final summary = data[i];
      var deltaN1 = 0.0;
      var deltaN2 = 0.0;
      var deltaN3 = 0.0;
      final n1Index = summaryDelta.indexWhere((delta) {
        String? id;
        if (categorySub == FieldForceSummaryCategorySub.customer) {
          (id, _) = summary.customer;
        } else if (categorySub == FieldForceSummaryCategorySub.outlet) {
          (id, _) = summary.outlet;
        } else if (categorySub == FieldForceSummaryCategorySub.product) {
          (id, _) = summary.product;
        }
        final idx = delta.flag1;
        return id == idx && delta.year == n1.year && delta.month == n1.month;
      });
      if (n1Index > -1) deltaN1 = double.parse(summaryDelta[n1Index].amount);

      final n2Index = summaryDelta.indexWhere((delta) {
        String? id;
        if (categorySub == FieldForceSummaryCategorySub.customer) {
          (id, _) = summary.customer;
        } else if (categorySub == FieldForceSummaryCategorySub.outlet) {
          (id, _) = summary.outlet;
        } else if (categorySub == FieldForceSummaryCategorySub.product) {
          (id, _) = summary.product;
        }
        final idx = delta.flag1;
        return id == idx && delta.year == n2.year && delta.month == n2.month;
      });
      if (n2Index > -1) deltaN2 = double.parse(summaryDelta[n2Index].amount);

      final n3Index = summaryDelta.indexWhere((delta) {
        String? id;
        if (categorySub == FieldForceSummaryCategorySub.customer) {
          (id, _) = summary.customer;
        } else if (categorySub == FieldForceSummaryCategorySub.outlet) {
          (id, _) = summary.outlet;
        } else if (categorySub == FieldForceSummaryCategorySub.product) {
          (id, _) = summary.product;
        }
        final idx = delta.flag1;
        return id == idx && delta.year == n3.year && delta.month == n3.month;
      });
      if (n3Index > -1) deltaN3 = double.parse(summaryDelta[n3Index].amount);

      summaryWithDelta.add(
        FieldForceSummaryWithDelta(
          summary: summary,
          deltaN1: deltaN1,
          deltaN2: deltaN2,
          deltaN3: deltaN3,
        ),
      );
    }

    return summaryWithDelta;
  }

  final (categorySub, _, _, _) = filter.categorySub;

  if (categorySub == FieldForceSummaryCategorySub.all) {
    products = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.product.value,
      flag1: '',
    );
    productsWithDelta.addAll(
      await getDelta(products, FieldForceSummaryCategorySub.product),
    );

    outlets = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.outlet.value,
      flag1: '',
    );
    outletsWithDelta.addAll(
      await getDelta(outlets, FieldForceSummaryCategorySub.outlet),
    );

    customers = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customer.value,
      flag1: '',
    );
    customersWithDelta.addAll(
      await getDelta(customers, FieldForceSummaryCategorySub.customer),
    );
  } else if (filter.customer != null && filter.outlet != null) {
    products = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerOutletProduct.value,
      flag1: filter.customer,
      flag2: filter.outlet,
      flag3: '',
    );
    productsWithDelta.addAll(
      await getDelta(products, FieldForceSummaryCategorySub.product),
    );
  } else if (filter.customer != null && filter.product != null) {
    outlets = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerOutletProduct.value,
      flag1: filter.customer,
      flag2: '',
      flag3: filter.product,
    );
    outletsWithDelta.addAll(
      await getDelta(outlets, FieldForceSummaryCategorySub.outlet),
    );
  } else if (filter.product != null && filter.outlet != null) {
    customers = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerOutletProduct.value,
      flag1: '',
      flag2: filter.outlet,
      flag3: filter.product,
    );
    customersWithDelta.addAll(
      await getDelta(customers, FieldForceSummaryCategorySub.customer),
    );
  } else if (filter.outlet != null) {
    products = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.outletProduct.value,
      flag1: filter.outlet,
      flag2: '',
    );
    productsWithDelta.addAll(
      await getDelta(products, FieldForceSummaryCategorySub.product),
    );

    customers = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerOutlet.value,
      flag1: '',
      flag2: filter.outlet,
    );
    customersWithDelta.addAll(
      await getDelta(customers, FieldForceSummaryCategorySub.customer),
    );
  } else if (filter.product != null) {
    outlets = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.outletProduct.value,
      flag1: '',
      flag2: filter.product,
    );
    outletsWithDelta.addAll(
      await getDelta(outlets, FieldForceSummaryCategorySub.outlet),
    );

    customers = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerProduct.value,
      flag1: '',
      flag2: filter.product,
    );
    customersWithDelta.addAll(
      await getDelta(customers, FieldForceSummaryCategorySub.customer),
    );
  } else if (filter.customer != null) {
    products = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerProduct.value,
      flag1: filter.customer,
      flag2: '',
    );
    productsWithDelta.addAll(
      await getDelta(products, FieldForceSummaryCategorySub.product),
    );

    outlets = await FieldForceSummaryRepository.instance.fetch(
      accessToken: UserRepositoryApp.instance.token!,
      areaCode: areaCode,
      categories: [category],
      dateEnd: dateTime,
      dateStart: dateTime,
      categorySub: FieldForceSummaryCategorySub.customerOutlet.value,
      flag1: filter.customer,
      flag2: '',
    );
    outletsWithDelta.addAll(
      await getDelta(outlets, FieldForceSummaryCategorySub.outlet),
    );
  }

  return (outletsWithDelta, customersWithDelta, productsWithDelta);
}
