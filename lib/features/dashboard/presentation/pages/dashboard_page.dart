import 'package:flutter/material.dart';
import 'package:frog_list/core/shared/components/checklist/checklist_tile_widget.dart';
import 'package:frog_list/core/shared/components/checklist/checklist_widget.dart';
import 'package:frog_list/core/shared/components/generic_widgets/generic_header_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  static const String route = '/';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<CheckListTileParams> checklistItems = [
    CheckListTileParams(
      text: "Arroz",
    ),
    CheckListTileParams(
      text: "Pimenta rosa em grãos",
    ),
    CheckListTileParams(
      text:
          "Mel puro de abelhas, proveniente de áreas de preservação ambiental na floresta amazônica brasileira, colhido por comunidades indígenas.",
    ),
    CheckListTileParams(
      text: "Azeitonas Kalamata premium em azeite de oliva extra virgem",
    ),
    CheckListTileParams(
      text: "Chocolate amargo 85% cacau orgânico",
    ),
    CheckListTileParams(
      text: "Xarope de bordo puro da colheita atua",
    ),
    CheckListTileParams(
      text:
          "Mix de frutas desidratadas exóticas, que inclui kiwi, goji berry, physalis e mangostão, provenientes de pomares orgânicos nas planícies tropicais do sudeste asiático.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _DashboardHeaderWidget(),
            Expanded(
              child: ChecklistWidget(
                checklistItems: checklistItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardHeaderWidget extends StatelessWidget {
  const _DashboardHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return GenericHeaderWidget(
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 6),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 22,
            ),
          ),
          Text(
            'Lista de compras',
            style: GoogleFonts.inter(fontSize: 22),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.refresh,
        size: 22,
      ),
    );
  }
}
