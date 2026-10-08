/**
 * Crée automatiquement le questionnaire Lokafête dans Google Forms,
 * relié à un tableau Google Sheets pour les réponses.
 *
 * Utilisation : script.google.com > Nouveau projet > coller ce code >
 * Enregistrer > choisir « creerQuestionnaire » > Exécuter > Autoriser.
 * Les liens s'affichent dans le « Journal d'exécution ».
 */
function creerQuestionnaire() {
  var form = FormApp.create('Comment gérez-vous vos cérémonies ?');
  form.setDescription(
    'Bonjour et merci de prendre 5 minutes pour ce questionnaire.\n\n' +
    "Je m'appelle Frédéric. Je fais une petite étude sur la façon dont les décorateurs, " +
    'loueurs de matériel, traiteurs et organisateurs d\'événements du Bénin organisent leurs cérémonies. ' +
    'Je ne vends rien : je veux comprendre votre travail.\n\n' +
    "Il n'y a pas de bonne ou de mauvaise réponse. Vos réponses restent confidentielles " +
    "et ne servent qu'à cette étude. Votre numéro WhatsApp, à la fin, est facultatif."
  );
  form.setCollectEmail(false);
  form.setProgressBar(true);
  form.setConfirmationMessage(
    "Merci beaucoup ! Vos réponses m'aident énormément. " +
    "Si vous avez laissé votre numéro, je vous écris bientôt sur WhatsApp. Frédéric"
  );

  // Section 1 : Votre activité (première page)
  plusieurs(form, 'Quel est votre métier ?', [
    'Décorateur ou décoratrice',
    'Loueur de matériel (chaises, bâches, vaisselle…)',
    'Traiteur',
    "Organisateur d'événements (wedding planner)"
  ], true);
  unique(form, 'Dans quelle ville travaillez-vous surtout ?', [
    'Cotonou', 'Abomey-Calavi', 'Porto-Novo', 'Parakou'
  ], true);
  unique(form, 'Depuis combien de temps faites-vous ce métier ?', [
    'Moins de 1 an', '1 à 3 ans', '3 à 5 ans', 'Plus de 5 ans'
  ]);
  unique(form, 'Combien de cérémonies faites-vous par mois, en moyenne ?', [
    '1 ou 2', '3 à 5', '6 à 10', 'Plus de 10'
  ]);
  unique(form, 'Combien de personnes travaillent avec vous, journaliers compris ?', [
    'Je travaille seul(e)', '2 à 5', '6 à 10', 'Plus de 10'
  ]);

  // Section 2 : Réservations et organisation
  form.addPageBreakItem().setTitle('Réservations et organisation');
  plusieurs(form, 'Comment vos clients vous contactent-ils ?', [
    'WhatsApp', 'Appel téléphonique', 'Facebook', 'Instagram', 'TikTok',
    'En personne, par le bouche-à-oreille'
  ]);
  plusieurs(form, 'Où notez-vous vos réservations ?', [
    'Dans un cahier ou un agenda papier',
    'Dans les notes du téléphone',
    'Dans les discussions WhatsApp',
    'Dans Excel ou Google Sheets',
    'Dans une application',
    'Je retiens tout de mémoire'
  ]);
  plusieurs(form, 'Ces 12 derniers mois, vous est-il arrivé…', [
    "d'oublier un rendez-vous ou une réservation",
    'de promettre le même matériel à deux clients le même jour',
    "de vous tromper de date, d'heure ou de lieu",
    "de perdre les demandes d'un client (thème, couleurs, photos)",
    'Rien de tout cela'
  ]);
  plusieurs(form, 'Comment le client vous montre-t-il ce qu\'il veut (thème, couleurs, décoration) ?', [
    'Il envoie des photos sur WhatsApp',
    'Il montre des images Pinterest ou Instagram',
    "Il m'explique lors d'un rendez-vous",
    'Il me laisse choisir'
  ], true, false).setHelpText('Facultatif, surtout pour les décorateurs');
  plusieurs(form, 'Comment envoyez-vous vos devis ?', [
    'Par message WhatsApp écrit', 'Par message vocal', 'Sur papier', 'En PDF ou Word',
    "Je donne le prix à l'oral", 'Je ne fais pas de devis'
  ]);

  // Section 3 : L'argent
  form.addPageBreakItem().setTitle("L'argent");
  unique(form, 'Demandez-vous une avance avant la cérémonie ?', [
    'Toujours', 'Souvent', 'Parfois', 'Jamais'
  ]);
  plusieurs(form, 'Comment vos clients vous paient-ils ?', [
    'MTN MoMo', 'Moov Money', 'Espèces', 'Virement bancaire'
  ], true);
  unique(form, 'Ces 12 derniers mois, des clients ont-ils payé le solde en retard ou pas du tout ?', [
    'Souvent', 'Parfois', 'Rarement', 'Jamais'
  ]);
  unique(form, 'Savez-vous combien vous gagnez vraiment sur chaque cérémonie, après les dépenses (fleurs, tissus, transport, journaliers) ?', [
    'Oui, je le calcule précisément', 'À peu près', 'Non'
  ]);
  unique(form, 'Avez-vous déjà eu du matériel abîmé, perdu ou non rendu après une cérémonie ?', [
    'Souvent', 'Parfois', 'Jamais', "Je n'ai pas de matériel en location"
  ]);

  // Section 4 : Vos difficultés
  form.addPageBreakItem().setTitle('Vos difficultés');
  form.addParagraphTextItem()
    .setTitle("Quel est votre plus gros problème dans l'organisation de vos cérémonies ?")
    .setRequired(true);
  form.addTextItem()
    .setTitle('Quelle tâche vous fait perdre le plus de temps ?')
    .setRequired(true);
  plusieurs(form, 'Quelles aides vous seraient les plus utiles ? Choisissez-en 3 au maximum.', [
    'Un planning avec des rappels',
    'Des devis propres à envoyer sur WhatsApp',
    'Le suivi des avances et des soldes',
    'Le suivi du matériel (sortie et retour)',
    'Le calcul du bénéfice par cérémonie',
    "L'organisation de l'équipe le jour J",
    'Un portfolio de mes réalisations à partager'
  ]).setValidation(
    FormApp.createCheckboxValidation()
      .setHelpText('Choisissez 3 réponses au maximum.')
      .requireSelectAtMost(3)
      .build()
  );
  unique(form, 'Utilisez-vous déjà une application pour gérer votre travail ?', [
    'Non'
  ], true).setHelpText('Si oui, écrivez laquelle dans « Autre ».');

  // Section 5 : Pour aller plus loin
  form.addPageBreakItem()
    .setTitle('Pour aller plus loin')
    .setHelpText('Je réfléchis à créer un outil pour faciliter ce travail. Dernières questions à ce sujet :');
  unique(form, 'Combien seriez-vous prêt(e) à payer par mois pour un outil qui règle ces problèmes ?', [
    "Rien, seulement si c'est gratuit",
    'Moins de 5 000 FCFA',
    '5 000 à 10 000 FCFA',
    '10 000 à 20 000 FCFA',
    'Plus de 20 000 FCFA'
  ]);
  unique(form, 'Accepteriez-vous de tester gratuitement cet outil pendant 1 mois ?', [
    'Oui', 'Peut-être', 'Non'
  ]);
  form.addTextItem()
    .setTitle('Votre prénom et votre numéro WhatsApp, pour vous inviter au test ou vous appeler 15 minutes')
    .setHelpText('Facultatif')
    .setRequired(false);

  // Tableau Google Sheets qui reçoit les réponses
  var tableau = SpreadsheetApp.create('Réponses : questionnaire Lokafête');
  form.setDestination(FormApp.DestinationType.SPREADSHEET, tableau.getId());

  var lien = form.getPublishedUrl();
  try {
    lien = form.shortenFormUrl(lien);
  } catch (e) {
    // Le lien long fonctionne aussi.
  }
  Logger.log('Lien à envoyer sur WhatsApp : ' + lien);
  Logger.log('Modifier le formulaire : ' + form.getEditUrl());
  Logger.log('Tableau des réponses : ' + tableau.getUrl());
}

// Question à choix unique (ronds).
function unique(form, titre, choix, autre) {
  return form.addMultipleChoiceItem()
    .setTitle(titre)
    .setChoiceValues(choix)
    .showOtherOption(!!autre)
    .setRequired(true);
}

// Question à plusieurs choix (cases à cocher).
function plusieurs(form, titre, choix, autre, obligatoire) {
  return form.addCheckboxItem()
    .setTitle(titre)
    .setChoiceValues(choix)
    .showOtherOption(!!autre)
    .setRequired(obligatoire !== false);
}
