import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../utils/color.dart';

class ConversionFunnelCard extends StatelessWidget {
  const ConversionFunnelCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Écoute les changements du provider
    final provider = context.watch<DashboardProvider>();
    final data = provider.currentFunnelMetrics;
    final currentIndex = provider.currentFunnelTabIndex;

    // On utilise la couleur orange pour correspondre à l'icône de l'entonnoir
    const accentColor = Color(0xFFD4813E);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderLight)
      ),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(accentColor),
          const SizedBox(height: 20),

          // Sélecteur d'onglets (Tab Selector)
          _buildTabSelector(provider, currentIndex),
          
          const SizedBox(height: 20),

          // Grille des statistiques (Metrics)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.6,
            children: [
              _buildMetricItem("Visitors", data.visitors.toString(), Icons.people_outline),
              _buildMetricItem("Added to Cart", data.addedToCart.toString(), Icons.shopping_cart_outlined),
              _buildMetricItem("Checkout Started", data.checkoutStarted.toString(), Icons.shopping_bag_outlined),
              _buildMetricItem("Completed Orders", data.completedOrders.toString(), Icons.check_circle_outline),
            ],
          ),
          
          const SizedBox(height: 16),
          Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 8),
          
          // Lien vers les rapports (Footer)
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(Color color) {
    return Row(
      children: [
        Icon(Icons.filter_alt_outlined, color: color,size: 20),
        const SizedBox(width: 8),
        const Text(
          "Conversion Funnel",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:AppColors.textPrimary),
        ),
      ],
    );
  }
// Sélecteur d'onglets pour les différentes vues du funnel
  Widget _buildTabSelector(DashboardProvider provider, int currentIndex) {
    final List<String> tabs = ["Website", "Marketplace", "Retails"];
    
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.fromBorderSide(BorderSide(color: AppColors.border.withOpacity(0.5))),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final bool isSelected = currentIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => provider.setFunnelTabIndex(index),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected 
                    ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] 
                    : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
// widget pour chaque bloc de métrique
  Widget _buildMetricItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(16),
        border: Border.fromBorderSide(BorderSide(color: AppColors.border.withOpacity(0.3))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "See monthly reports",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 18),
          ],
        ),
      ),
    );
  }
}