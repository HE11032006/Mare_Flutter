import 'package:flutter/material.dart';

class BusinessTrafficCard extends StatelessWidget {
  const BusinessTrafficCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isWide ? 20 : 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(isWide),
              const SizedBox(height: 16),
              _trafficTarget(isWide),
              const SizedBox(height: 14),
              _segmentedProgress(),
              const SizedBox(height: 14),
              _platformsHeader(),
              const SizedBox(height: 8),
              _platformRow(
                color: Colors.orange,
                icon: Icons.language,
                name: 'Website',
                value: '10.24K',
                percent: '+34.7%',
                up: true,
              ),
              _platformRow(
                color: Colors.green,
                icon: Icons.store,
                name: 'Marketplace',
                value: '180K',
                percent: '+80.5%',
                up: true,
              ),
              _platformRow(
                color: Colors.red,
                icon: Icons.point_of_sale,
                name: 'Retail POS',
                value: '598',
                percent: '-15.6%',
                up: false,
              ),
            ],
          ),
        );
      },
    );
  }

  // ================= HEADER =================

  Widget _header(bool isWide) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Traffics',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isWide ? 18 : 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Keep an eye on your business orders',
              style: TextStyle(
                fontSize: isWide ? 13 : 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }

  // ================= TARGET =================

  Widget _trafficTarget(bool isWide) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '240K / 500K TM traffic targets',
          style: TextStyle(fontSize: isWide ? 14 : 12),
        ),
        Text(
          '+5.2% vs yesterday',
          style: TextStyle(
            fontSize: isWide ? 13 : 12,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ================= SEGMENTED PROGRESS =================

  Widget _segmentedProgress() {
    return SizedBox(
      height: 8,
      child: Row(
        children: [
          _segment(25, Colors.orange),
          _segment(20, Colors.amber),
          _segment(15, Colors.lightGreen),
          _segment(12, Colors.green),
        ],
      ),
    );
  }

  Widget _segment(int flex, Color color) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.only(right: 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  // ================= TABLE HEADER =================

  Widget _platformsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: Text(
              'Platforms',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              'Today',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  // ================= PLATFORM ROW =================

  Widget _platformRow({
    required Color color,
    required IconData icon,
    required String name,
    required String value,
    required String percent,
    required bool up,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(icon, size: 16),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  up ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 14,
                  color: up ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 2),
                Text(
                  percent,
                  style: TextStyle(
                    fontSize: 12,
                    color: up ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
