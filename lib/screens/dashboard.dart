import 'package:flutter/material.dart';
import '../models/dashboardModels.dart';
import '../utils/color.dart';
import '../utils/text_style.dart';
import '../widget/cards/activity_seeds.dart';
import '../widget/cards/customer_sentiment_card.dart';
import '../widget/cards/business_traffic.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ActivityItem> activi = [
      const ActivityItem(
        type: ActivityType.userAction,
        title: "Nouvelle vente de",
        highlight: "Jordan 4 Retro",
        timeAgo: "Il y a 2 min",
      ),
      const ActivityItem(
        type: ActivityType.alert,
        title: "Stock faible sur",
        highlight: "Yeezy Boost 350",
        timeAgo: "Il y a 15 min",
      ),
      const ActivityItem(
        type: ActivityType.aiGenerated,
        title: "Optimisation IA suggérée",
        timeAgo: "Il y a 1h",
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildHeaderSection(context),
                const SizedBox(height: 12),

                Container(
                  width: double.infinity,

                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: AppColors.border),

                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [

                      // efficently, n'oublier pas que c'est un carrousel qui défile, regardez bien la figure
                      _efficentlycard(),

                      const SizedBox(height: 18),
                      // le workflow
                      _workflowcard(),


                      const SizedBox(height: 18),
                      //le business traffic
                      _businessTrafficCard(),

                      const SizedBox(height: 18),
                      //le widget pour la convention funnel
                      _conventionfunnelcard(),


                      const SizedBox(height: 18),

                      // la partie customer sentiment
                      //ici, on va appeler directement le widget customer sentiment card via le fichier customer_sentiment_card.dart
                      const CustomerSentimentCard(),


                      const SizedBox(height: 18,),
                      ActivitiesCard(activities: activi),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dashboard',
            style: AppTextStyles.heading3.copyWith(
              color: Colors.black, // Texte en blanc sur le fond marron
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              _buildHeaderIcon(context, Icons.merge_type, "Pull Request"),
              const SizedBox(width: 12),
              _buildHeaderIcon(context, Icons.apps_rounded, "Menu"),
              const SizedBox(width: 12),
              _buildHeaderIcon(context, Icons.add_box_rounded, "Ajouter"),
            ],
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars(); // Enlève le message précédent s'il y en a un

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating, // Rend la snackbar flottante (arrondie)
        width: 200, // Largeur réduite pour l'effet "petit toast"
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        animation: CurvedAnimation(
          parent: AnimationController(vsync: ScaffoldMessenger.of(context)), // Géré automatiquement par Flutter
          curve: Curves.easeOutBack, // Transition rapide et un peu élastique
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        _showToast(context, label); // Appelle le toast ici
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black, size: 22),
      ),
    );
  }

  Widget _efficentlycard() {
    return Center(
      child: Text("La partie efficiency card"),
    );
  }

  Widget _workflowcard() {
    return Center(
      child: Text("La partie workflowcard"),
    );
  }

  Widget _businessTrafficCard() {
    return const BusinessTrafficCard();
  }

  Widget _conventionfunnelcard() {
    return Center(
      child: Text("La partie convention funnel"),
    );
  }

/*le widget pour la partie customer sentiment
  à déjà été créé dans le fichier customer_sentiment_card.dart
  et on l'a juste appelé plus haut dans le widgetbuild de la manière suivante:
  const CustomerSentimentCard()
 */
  


  Widget _activitySeed(String emoji, String name, String comment, int stars) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                name,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: List.generate(
                  stars,
                      (index) => Icon(
                    Icons.star_rounded,
                    color: AppColors.warning,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}