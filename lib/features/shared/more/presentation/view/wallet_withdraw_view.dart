import 'package:flutter/material.dart';

class WalletWithdrawView extends StatefulWidget {
  const WalletWithdrawView({super.key});

  @override
  State<WalletWithdrawView> createState() => _WalletWithdrawViewState();
}

class _WalletWithdrawViewState extends State<WalletWithdrawView> {
  int selectedMethod = 0; // 0: Instapay, 1: Wallet
  final TextEditingController instapayController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Color(0xFF23245D), size: 32),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'المحفظه',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF23245D),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Center(
                    child: Text(
                      'رصيدك الحالي:',
                      style: TextStyle(
                        color: Color(0xFF29ABE2),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '17000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Color(0xFF23245D),
                            ),
                          ),
                          TextSpan(
                            text: ' EGP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF23245D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, color: Color(0xFFE5E5E5)),
                  const SizedBox(height: 16),
                  // Withdraw Tab
                  const Center(
                    child: Text(
                      'السحب',
                      style: TextStyle(
                        color: Color(0xFF29ABE2),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF29ABE2),
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Payment Method Selection
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedMethod = 0),
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: selectedMethod == 0
                                  ? const Color(0xFF29ABE2)
                                  : const Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'INSTAPAY',
                              style: TextStyle(
                                color: selectedMethod == 0
                                    ? Colors.white
                                    : const Color(0xFF23245D),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedMethod = 1),
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: selectedMethod == 1
                                  ? const Color(0xFF29ABE2)
                                  : const Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'محفظه',
                              style: TextStyle(
                                color: selectedMethod == 1
                                    ? Colors.white
                                    : const Color(0xFF23245D),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Instapay Address
                  if (selectedMethod == 0) ...[
                    const Text(
                      'عنوان الدفع',
                      style: TextStyle(
                        color: Color(0xFF23245D),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '@instapay',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: instapayController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                              ),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                                thickness: 1, color: Color(0xFFE5E5E5))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child:
                              Text('او', style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                            child: Divider(
                                thickness: 1, color: Color(0xFFE5E5E5))),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                  // Phone Number
                  const Text(
                    'رقم الهاتف',
                    style: TextStyle(
                      color: Color(0xFF23245D),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      style: const TextStyle(fontSize: 16),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF29ABE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'سحب',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
