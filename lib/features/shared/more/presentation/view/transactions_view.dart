import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/shared/more/presentation/manager/cubit/more_cubit.dart';
import 'package:grad_project/features/shared/more/presentation/manager/cubit/more_cubit_state.dart';
import 'package:grad_project/features/shared/more/data/repos/more_repo.dart';
import 'package:intl/intl.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoreCubitCubit(getIt<MoreRepo>())..getTransactions(),
      child: Builder(builder: (context) {
        return BlocBuilder<MoreCubitCubit, MoreCubitState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color(0xFF29ABE2),
              body: SafeArea(
                child: Column(
                  children: [
                    // Custom App Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.indigo, size: 32),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const Spacer(),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'أحمد خالد',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.verified,
                                      color: Colors.white, size: 20),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                        ],
                      ),
                    ),
                    // Main content
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'المعاملات',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 160,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF29ABE2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () {
                                    GoRouter.of(context)
                                        .push(RouterPath.walletWithdrawView);
                                  },
                                  child: const Text(
                                    'السحب',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (state is TransactionsLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (state is TransactionsError) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'حدث خطأ أثناء تحميل المعاملات',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              state.message,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(height: 16),
                                            ElevatedButton(
                                              onPressed: () => context
                                                  .read<MoreCubitCubit>()
                                                  .getTransactions(),
                                              child:
                                                  const Text('إعادة المحاولة'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (state is TransactionsSuccess) {
                                      final transactions = state.transactions;
                                      if (transactions.isEmpty) {
                                        return const Center(
                                            child:
                                                Text('لا توجد معاملات حالياً'));
                                      }
                                      // Group transactions by date (today, yesterday, or date)
                                      final now = DateTime.now();
                                      Map<String, List<dynamic>> grouped = {};
                                      for (var tran in transactions) {
                                        String group;
                                        if (tran.createdAt != null) {
                                          final date = tran.createdAt!;
                                          if (date.year == now.year &&
                                              date.month == now.month &&
                                              date.day == now.day) {
                                            group = 'اليوم';
                                          } else if (date.year == now.year &&
                                              date.month == now.month &&
                                              date.day ==
                                                  now
                                                      .subtract(const Duration(
                                                          days: 1))
                                                      .day) {
                                            group = 'أمس';
                                          } else {
                                            group = DateFormat('y MMMM d', 'ar')
                                                .format(date);
                                          }
                                        } else {
                                          group = 'غير معروف';
                                        }
                                        grouped
                                            .putIfAbsent(group, () => [])
                                            .add(tran);
                                      }
                                      return ListView(
                                        children: grouped.entries.map((entry) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                  entry.key,
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              ...entry.value.map((tran) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 12.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFF7F8FA),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  tran.providerName ??
                                                                      '-',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 4),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                    children: [
                                                                      const TextSpan(
                                                                          text:
                                                                              'لقد استلمت '),
                                                                      TextSpan(
                                                                        text:
                                                                            '${tran.amount ?? '-'} ج.م',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xFF29ABE2),
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                          text:
                                                                              ' بنجاح مقابل خدمة ${tran.providerserviceName ?? '-'}.'),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 4),
                                                                Text(
                                                                  tran.createdAt !=
                                                                          null
                                                                      ? '${DateFormat('d MMMM yyyy', 'ar').format(tran.createdAt!)} - ${DateFormat('hh:mm a', 'ar').format(tran.createdAt!)}'
                                                                      : '-',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF29ABE2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: const Icon(
                                                                Icons.sync_alt,
                                                                color: Colors
                                                                    .white,
                                                                size: 28),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    }
                                    // Default fallback
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
