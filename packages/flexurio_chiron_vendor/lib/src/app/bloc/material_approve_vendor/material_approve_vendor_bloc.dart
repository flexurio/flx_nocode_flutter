import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'material_approve_vendor_bloc.freezed.dart';

@freezed
class MaterialApproveVendorState with _$MaterialApproveVendorState {
  const factory MaterialApproveVendorState.initial() = _Initial;
  const factory MaterialApproveVendorState.loading() = _Loading;
  const factory MaterialApproveVendorState.success() = _Success;
  const factory MaterialApproveVendorState.error(String error) = _Error;
}

@freezed
class MaterialApproveVendorEvent with _$MaterialApproveVendorEvent {
  const factory MaterialApproveVendorEvent.create({
    required String materialId,
    required String vendorId,
    required String supplierId,
    required String certificateDocumentId,
    required DateTime? halalCertificateExpired,
    required String halalInstitution,
    required String halalNoCertifikate,
    required String description,
    required String storageProcedure,
    required String category,
    required String type,
  }) = _Create;
  const factory MaterialApproveVendorEvent.update({
    required int id,
    required String materialId,
    required String vendorId,
    required String supplierId,
    required String certificateDocumentId,
    required String description,
    required String storageProcedure,
    required String category,
    required String type,
  }) = _Update;
  const factory MaterialApproveVendorEvent.editHalalCertificate({
    required MaterialApprovedVendor materialApprovedVendor,
    required DateTime halalCertificateExpired,
    required String halalInstitution,
    required String halalNoCertificate,
  }) = _EditHalalCertificate;
  const factory MaterialApproveVendorEvent.delete(int id) = _Delete;
}

class MaterialApproveVendorBloc
    extends Bloc<MaterialApproveVendorEvent, MaterialApproveVendorState> {
  MaterialApproveVendorBloc() : super(const _Initial()) {
    on<MaterialApproveVendorEvent>((event, emit) async {
      await event.when(
        create: (
          materialId,
          vendorId,
          supplierId,
          certificateDocumentId,
          halalCertificateExpired,
          halalInstitution,
          halalNoCertifikate,
          description,
          storageProcedure,
          category,
          type,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialApprovedVendorCreate(
              accessToken: UserRepositoryApp.instance.token!,
              materialId: materialId,
              vendorId: vendorId,
              supplierId: supplierId,
              certificateDocumentId: certificateDocumentId,
              halalCertificateExpired: halalCertificateExpired,
              halalInstitution: halalInstitution,
              halalNoCertificate: halalNoCertifikate,
              description: description,
              storageProcedure: storageProcedure,
              category: category,
              type: type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          id,
          materialId,
          vendorId,
          supplierId,
          certificateDocumentId,
          description,
          storageProcedure,
          category,
          type,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialApprovedVendorUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              materialId: materialId,
              vendorId: vendorId,
              supplierId: supplierId,
              certificateDocumentId: certificateDocumentId,
              description: description,
              storageProcedure: storageProcedure,
              category: category,
              type: type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        editHalalCertificate: (
          materialApprovedVendor,
          halalCertificateExpired,
          halalInstitution,
          halalNoCertificate,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance
                .materialApprovedVendorEditHalalCertificate(
              accessToken: UserRepositoryApp.instance.token!,
              materialApprovedVendor: materialApprovedVendor,
              halalCertificateExpired: halalCertificateExpired,
              halalInstitution: halalInstitution,
              halalNoCertificate: halalNoCertificate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (int id) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialApprovedVendorDelete(
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
