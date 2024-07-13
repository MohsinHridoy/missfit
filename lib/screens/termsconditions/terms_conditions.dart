import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

// Model class to represent each term and condition item
class TermItem {
  final String title;
  final String details;

  TermItem(this.title, this.details);
}

class TermConditions extends StatelessWidget {

  const TermConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of terms and conditions items
    final List<TermItem> terms = [
      TermItem(
        'Prestations:',
        'La souscription d’un abonnement donne un droit d’accès au Fitness Miss Fit (Avenue de l’Industrie 49A, 1870 Monthey), y compris l’accès aux équipements.',
      ),
      TermItem(
        'Règlement interne:',
        'L’Adhérente déclare avoir pris connaissance du règlement interne et d’adhérer sans restriction ni réserve aux règles de sécurité et d’hygiène. Elle s’engage à respecter les consignes suivantes : • Porter des vêtements et des chaussures de sport spécifiques et propres. • Utiliser une serviette sur les appareils et nettoyer sa place et son matériel après utilisation. • Adopter un comportement agréable et respectueux envers les autres membres et le personnel de Miss Fit Monthey.',
      ),
      TermItem(
        'Abonnement:',
        'Le contrat d’abonnement est nominatif : en aucun cas il ne peut être partagé avec un tiers. Conditions liées à l’âge : L’utilisation des installations à disposition par des mineures est admise uniquement avec l’autorisation écrite des parents ou du représentant légal qui signera le présent contrat.',
      ),
      TermItem(
        'Les abonnements sont nominatifs et intransmissibles:',
        "Le vol ou la perte d'un abonnement doit être signalé immédiatement au secrétariat de Miss Fit. Tout emploi abusif d'un abonnement tel que le prêt à une autre personne, le passage à plusieurs ou autre, sera sanctionné par son retrait immédiat, sans avertissement. Le titulaire ne pourra prétendre à aucun remboursement et devra s’acquitter d’une amende de CHF 100.-.",
      ),
      TermItem(
        'Résiliation à l’initiative de Miss Fit:',
        "L’abonnement peut être résilié de plein droit à l’initiative de Miss Fit :  • Dans le cas où l’attitude ou le comportement de l’Adhérente serait contraire aux bonnes mœurs, ou occasionnerait une gêne caractérisée pour les autres abonnées ou serait non conforme au présent contrat ou au règlement interne du fitness.",
      ),
      TermItem(
        'Paiement:',
        "L’Adhérente s’engage à régler son abonnement selon les conditions stipulées dans le présent document.",
      ),
      TermItem(
        'Transfert d’abonnement:',
        "Il n’est pas possible de transférer son abonnement à un tiers.  Résiliation exceptionnelle : Une résiliation exceptionnelle est accordée si l’Adhérente quitte le pays, et uniquement sur présentation d’une attestation officielle obtenue auprès de l’Office Cantonal de la Population.",
      ),
      TermItem(
        'Modification des tarifs:',
        "Les prix sont garantis pour la durée du contrat. Le tarif peut être révisé au moment du renouvellement de l’abonnement. Dans ce cas, Miss Fit informera les Adhérentes par voie d’affichage et/ou par courriel, au minimum 2 mois avant la mise en application du nouveau prix.",
      ),
      TermItem(
        'Fermeture annuelle:',
        "Miss Fit se réserve la possibilité de fermer ses locaux au maximum 4 semaines par année pour transformation, réfection, etc. Cette fermeture éventuelle n’est pas considérée comme période d’absence. Les Adhérentes sont informées 1 mois à l’avance.",
      ),
      // Add more TermItem objects as needed
    ];

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(97.0),
      //   child: AppBar(
      //     backgroundColor: Colors.white,
      //     leading: IconButton(
      //       icon: const Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //     centerTitle: true,
      //     title: const Text(
      //       'Terms & Conditions',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         color: Color(0xFF1E293B),
      //         fontSize: 18,
      //         fontFamily: 'Kanit',
      //         fontWeight: FontWeight.w500,
      //         height: 1.4, // Adjusted height to align the text properly
      //       ),
      //     ),
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Termes et conditions',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 4.9,
          ),
          SizedBox(height: 15,),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: terms.length,
              itemBuilder: (context, index) {
                final term = terms[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0,top: 20,left: 7,right: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        term.title,
                        style: const TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 18,
                          fontFamily: 'Archivo-Semibold',
                          fontWeight: FontWeight.w600,
                          height: 1.10,

                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        term.details,
                        style: const TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 18,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1.7,

                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}