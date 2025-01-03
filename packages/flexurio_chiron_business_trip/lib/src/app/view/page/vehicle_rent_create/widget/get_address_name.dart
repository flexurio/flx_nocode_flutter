import 'package:flexurio_chiron_business_trip/src/app/bloc/cek_address_detail_query/cek_address_detail_query_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAddressName extends StatelessWidget {
  const GetAddressName({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final String latitude;
  final String longitude;

  static Widget prepare({
    required String latitude,
    required String longitude,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CekAddressDetailQueryBloc()
            ..add(
              CekAddressDetailQueryEvent.fetch(
                latitude: latitude,
                longitude: longitude,
              ),
            ),
        ),
      ],
      child: GetAddressName(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CekAddressDetailQueryBloc, CekAddressDetailQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (cekAddress) {
            return Tooltip(
              message: cekAddress,
              child: SizedBox(
                width: 250,
                child: Text(
                  cekAddress,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          orElse: () => const Center(
            child: Text(
              'Not Available',
            ),
          ),
        );
      },
    );
  }
}
