import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_attachment.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_attachment_query_bloc.freezed.dart';

@freezed
abstract class SalesOrderAttachmentQueryState
    with _$SalesOrderAttachmentQueryState {
  const factory SalesOrderAttachmentQueryState.initial() = _Initial;
  const factory SalesOrderAttachmentQueryState.loading() = _Loading;
  const factory SalesOrderAttachmentQueryState.loaded({
    SalesOrderAttachment? attachment,
    List<int>? bytes,
  }) = _Loaded;
  const factory SalesOrderAttachmentQueryState.loadedAttachmentFile(
    List<int> attachment,
  ) = _LoadedAttachmentFile;
  const factory SalesOrderAttachmentQueryState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderAttachmentQueryEvent
    with _$SalesOrderAttachmentQueryEvent {
  const factory SalesOrderAttachmentQueryEvent.fetchAttachment({
    required SalesOrder salesOrder,
    required int revisionNo,
  }) = _FetchAttachment;
  const factory SalesOrderAttachmentQueryEvent.fetchAttachmentFile({
    required SalesOrderAttachment attachment,
  }) = _FetchAttachmentFile;
}

class SalesOrderAttachmentQueryBloc extends Bloc<SalesOrderAttachmentQueryEvent,
    SalesOrderAttachmentQueryState> {
  SalesOrderAttachmentQueryBloc() : super(const _Initial()) {
    on<SalesOrderAttachmentQueryEvent>((event, emit) async {
      await event.when(
        fetchAttachment: (
          salesOrder,
          revisionNo,
        ) async {
          emit(const _Loading());
          try {
            List<int>? bytes;
            SalesOrderAttachment? salesOrderAttachment;
            final response =
                await SalesOrderRepository.instance.salesOrderFetchDataFile(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
              revisionNo: revisionNo,
            );

            if (response.isNotEmpty) {
              salesOrderAttachment = response.first;
              bytes = await SalesOrderRepository.instance.salesOrderFetchFile(
                accessToken: UserRepositoryApp.instance.token!,
                attachment: salesOrderAttachment,
              );
            }

            emit(_Loaded(
              attachment: salesOrderAttachment,
              bytes: bytes,
            ));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchAttachmentFile: (attachment) async {
          emit(const _Loading());
          try {
            final response =
                await SalesOrderRepository.instance.salesOrderFetchFile(
              accessToken: UserRepositoryApp.instance.token!,
              attachment: attachment,
            );
            saveFile(
              response,
              attachment.document.replaceAll('file/documents/', ''),
            );
            emit(const _Loaded());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
