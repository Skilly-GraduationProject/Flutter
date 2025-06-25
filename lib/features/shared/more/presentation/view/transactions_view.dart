import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data
    final transactions = [
      {
        'group': 'اليوم',
        'items': [
          {
            'name': 'احمد ايمن',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
          {
            'name': 'محمد حسام',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
        ],
      },
      {
        'group': 'أمس',
        'items': [
          {
            'name': 'شريف علي',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة المعيشه.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
          {
            'name': 'احمد عامر',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
        ],
      },
      {
        'group': '2025 يوليو 17',
        'items': [
          {
            'name': 'حازم شومان',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
          {
            'name': 'امجد سمير',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
        ],
      },
      {
        'group': '2025 يوليو 16',
        'items': [
          {
            'name': 'احمد ايمن',
            'amount': '4000',
            'desc': 'بنجاح مقابل خدمة غرفة النوم.',
            'date': DateTime(2025, 5, 28, 2, 37),
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF29ABE2),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          Icon(Icons.verified, color: Colors.white, size: 20),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          onPressed: () {},
                          child: const Text(
                            'السحب',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
                          itemCount: transactions.length,
                          itemBuilder: (context, groupIdx) {
                            final group = transactions[groupIdx];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    group['group'] as String,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                    (group['items'] as List).length, (itemIdx) {
                                  final item =
                                      (group['items'] as List)[itemIdx];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF7F8FA),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item['name'],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 16,
                                                      ),
                                                      children: [
                                                        const TextSpan(
                                                            text:
                                                                'لقد استلمت '),
                                                        TextSpan(
                                                          text:
                                                              '${item['amount']} ج.م',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF29ABE2),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text:
                                                                ' ${item['desc']}'),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    '${DateFormat('d MMMM yyyy', 'ar').format(item['date'])} - ${DateFormat('hh:mm a', 'ar').format(item['date'])}',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF29ABE2),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: const Icon(Icons.sync_alt,
                                                  color: Colors.white,
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
  }
}
