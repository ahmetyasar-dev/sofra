import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../theme/app_theme.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodItem item;
  final void Function(FoodItem) onAddToCart;

  const FoodDetailScreen(
      {super.key, required this.item, required this.onAddToCart});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  bool _added = false;

  void _handleAdd() {
    for (int i = 0; i < _quantity; i++) {
      widget.onAddToCart(widget.item);
    }
    setState(() => _added = true);
    Future.delayed(const Duration(seconds: 2),
        () => mounted ? setState(() => _added = false) : null);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: CustomScrollView(
        slivers: [
          // ── Büyük görsel + geri butonu ──
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppColors.cream,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textDark, size: 18),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.bej,
                      child: const Center(
                        child: Icon(Icons.restaurant,
                            size: 80, color: AppColors.oliveSoft),
                      ),
                    ),
                  ),
                  // Alt gradient
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.cream,
                            AppColors.cream.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── İçerik ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori
                  Text(
                    item.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // İsim
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Rating + bilgiler
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.star_rounded,
                        iconColor: AppColors.gold,
                        label: item.rating.toStringAsFixed(1),
                      ),
                      const SizedBox(width: 10),
                      _InfoChip(
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.oliveSoft,
                        label: item.prepTime,
                      ),
                      const SizedBox(width: 10),
                      _InfoChip(
                        icon: Icons.local_fire_department_rounded,
                        iconColor: Colors.orange.shade300,
                        label: '${item.calories} kal',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // İnce altın çizgi
                  Container(
                    height: 1,
                    color: AppColors.gold.withValues(alpha: 0.25),
                  ),
                  const SizedBox(height: 24),

                  // Açıklama
                  const Text(
                    'Hakkında',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMid,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Miktar seçici
                  Row(
                    children: [
                      const Text(
                        'Miktar',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Spacer(),
                      _QuantityControl(
                        quantity: _quantity,
                        onDecrease: () {
                          if (_quantity > 1) setState(() => _quantity--);
                        },
                        onIncrease: () => setState(() => _quantity++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Fiyat + Sepete ekle
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.olive,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Toplam',
                              style: TextStyle(
                                  color: AppColors.oliveSoft, fontSize: 12),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '₺${(item.price * _quantity).toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontFamily: 'Georgia',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: _handleAdd,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            decoration: BoxDecoration(
                              color: _added ? AppColors.gold : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              _added ? '✓ Eklendi' : 'Sepete Ekle',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: _added ? Colors.white : AppColors.olive,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _InfoChip(
      {required this.icon, required this.iconColor, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bej,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 5),
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark)),
        ],
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const _QuantityControl(
      {required this.quantity,
      required this.onDecrease,
      required this.onIncrease});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bej,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _QBtn(icon: Icons.remove, onTap: onDecrease),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ),
          _QBtn(icon: Icons.add, onTap: onIncrease),
        ],
      ),
    );
  }
}

class _QBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: AppColors.olive),
      ),
    );
  }
}
