import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:gap/gap.dart';

final List<String> _recentSymbols = [];

class SymbolCategory {
  final String title;
  final List<String> symbols;

  const SymbolCategory({required this.title, required this.symbols});
}

const List<SymbolCategory> _defaultSymbolCategories = [
  SymbolCategory(
    title: 'Greek & Math',
    symbols: [
      'α', 'β', 'γ', 'δ', 'ε', 'ζ', 'η', 'θ', 'ι', 'κ', 'λ', 'μ', 'ν', 'ξ',
      'π', 'ρ', 'σ', 'τ', 'υ', 'φ', 'χ', 'ψ', 'ω',
      'Δ', 'Θ', 'Λ', 'Ξ', 'Π', 'Σ', 'Φ', 'Ψ', 'Ω',
      '±', '∓', '×', '÷', '√', '∞', '∫', '≈', '≠', '≤', '≥', '≡', '‰',
      '∑', '∏', '∂', '∇', '¬', '∧', '∨', '∩', '∪', '∈', '∉', '⊂', '⊃', '⊆', '⊇',
    ],
  ),
  SymbolCategory(
    title: 'Units & Scientific',
    symbols: [
      'µg', 'µL', 'µm', 'mg', 'mL', 'pH', '‰', 'Å', '℃', '℉', '°',
      '¹', '²', '³', 'ⁿ', '⁺', '⁻', '⁽', '⁾',
      '→', '←', '↑', '↓', '↔', '⇌', '⇒', '⇔',
      'λ', 'Ω', 'σ', 'Δ', 'π',
    ],
  ),
  SymbolCategory(
    title: 'Special Characters',
    symbols: [
      '§', '¶', '†', '‡', '•', '–', '—', '…',
      '«', '»', '“', '”', '‘', '’', '‹', '›',
      '€', '£', '¥', '¢', '₱', 'Rp', '№',
      '®', '™', '©', '°', '±', '‰', '¼', '½', '¾',
    ],
  ),
];

Future<void> showSymbolPickerDialog({
  required BuildContext context,
  required TextEditingController controller,
}) async {
  await showDialog<void>(
    context: context,
    builder: (ctx) => SymbolPickerDialog(controller: controller),
  );
}

class SymbolPickerDialog extends StatefulWidget {
  final TextEditingController controller;

  const SymbolPickerDialog({
    super.key,
    required this.controller,
  });

  @override
  State<SymbolPickerDialog> createState() => _SymbolPickerDialogState();
}

class _SymbolPickerDialogState extends State<SymbolPickerDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _defaultSymbolCategories.length,
      vsync: this,
    );
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _insertSymbol(String symbol) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;

    int start = selection.start;
    int end = selection.end;

    if (start < 0 || start > text.length) {
      start = text.length;
      end = text.length;
    }

    final newText = text.replaceRange(start, end, symbol);
    final newCursorPosition = start + symbol.length;

    widget.controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );

    setState(() {
      _recentSymbols.remove(symbol);
      _recentSymbols.insert(0, symbol);
      if (_recentSymbols.length > 20) {
        _recentSymbols.removeLast();
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Disisipkan: $symbol'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        width: 220,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: isDark ? const Color(0xFF1E1E2C) : Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        width: 480,
        constraints: const BoxConstraints(maxHeight: 560),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Title & Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.functions,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      'Sisipkan Simbol',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Tutup',
                ),
              ],
            ),
            const Gap(12),

            // Search input
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari simbol / karakter...',
                prefixIcon: const Icon(Icons.search, size: 18),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isDark ? Colors.white24 : Colors.black12,
                  ),
                ),
              ),
            ),
            const Gap(10),

            // Recently used symbols section
            if (_recentSymbols.isNotEmpty && _searchQuery.isEmpty) ...[
              Row(
                children: [
                  Text(
                    'Baru-baru ini digunakan:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white60 : Colors.black54,
                    ),
                  ),
                ],
              ),
              const Gap(6),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recentSymbols.length,
                  separatorBuilder: (_, __) => const Gap(6),
                  itemBuilder: (context, index) {
                    final sym = _recentSymbols[index];
                    return _SymbolItemButton(
                      symbol: sym,
                      onTap: () => _insertSymbol(sym),
                      isRecent: true,
                    );
                  },
                ),
              ),
              const Gap(10),
              const Divider(height: 1),
              const Gap(10),
            ],

            // Tabs or Search Results
            if (_searchQuery.isNotEmpty)
              Expanded(child: _buildSearchResults())
            else ...[
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(3),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor:
                      isDark ? Colors.white : const Color(0xFF1D4ED8),
                  unselectedLabelColor:
                      isDark ? Colors.white60 : const Color(0xFF64748B),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF2563EB)
                        : const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  tabs: _defaultSymbolCategories
                      .map(
                        (cat) => Tab(
                          height: 34,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(cat.title),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Gap(10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _defaultSymbolCategories.map((cat) {
                    return _buildSymbolGrid(cat.symbols);
                  }).toList(),
                ),
              ),
            ],
            const Gap(12),

            // Bottom action button
            Align(
              alignment: Alignment.centerRight,
              child: Button.string(
                permission: null,
                isInProgress: false,
                action: 'Selesai',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    final allSymbols = _defaultSymbolCategories
        .expand((cat) => cat.symbols)
        .toSet()
        .where((sym) => sym.toLowerCase().contains(_searchQuery))
        .toList();

    if (allSymbols.isEmpty) {
      return const Center(
        child: Text(
          'Simbol tidak ditemukan',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return _buildSymbolGrid(allSymbols);
  }

  Widget _buildSymbolGrid(List<String> symbols) {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 56,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: symbols.length,
      itemBuilder: (context, index) {
        final sym = symbols[index];
        return _SymbolItemButton(
          symbol: sym,
          onTap: () => _insertSymbol(sym),
        );
      },
    );
  }
}

class _SymbolItemButton extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;
  final bool isRecent;

  const _SymbolItemButton({
    required this.symbol,
    required this.onTap,
    this.isRecent = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: isRecent
          ? (isDark ? Colors.white10 : Colors.grey.shade200)
          : (isDark ? const Color(0xFF2B2B3D) : Colors.grey.shade100),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          width: isRecent ? 42 : null,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.06),
            ),
          ),
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: symbol.length > 2 ? 12 : 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
