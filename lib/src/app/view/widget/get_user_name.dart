import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';

class GetNameUser extends StatelessWidget {
  const GetNameUser({required this.userId, super.key, this.style});

  final int userId;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EmployeeRepository.findById(
        UserRepositoryApp.instance.token!,
        userId.toString(),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data?.name ?? '-', style: style);
        }
        return Text('-', style: style);
      },
    );
  }
}

class UsersBuilder extends StatelessWidget {
  const UsersBuilder({required this.builder, super.key});

  final Widget Function(List<Employee> employees) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EmployeeRepository.fetch(UserRepositoryApp.instance.token!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data ?? []);
        }
        return const CupertinoActivityIndicator();
      },
    );
  }
}

class CustomerBuilder extends StatelessWidget {
  const CustomerBuilder({required this.builder, super.key});

  final Widget Function(List<Customer> customer) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchCustomers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data?.data ?? []);
        }
        return const CupertinoActivityIndicator();
      },
    );
  }

  Future<PageOptions<Customer>> _fetchCustomers() {
    final financeRepository = FinanceRepository(
      dio: Api.dio,
      onUnauthorized: AuthenticationRepository.logout,
    );
    return financeRepository.customerFetch(
      accessToken: UserRepositoryApp.instance.token!,
      pageOptions: PageOptions.emptyNoLimit(),
    );
  }
}

extension ListEmployeeExtension<T> on List<Employee> {
  Employee? find(String userId) {
    final x = where((e) => e.nip == userId);
    return x.isEmpty ? null : x.first;
  }
}
