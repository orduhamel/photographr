module TaskMailtoHelper
  def mailto_partial_for_task(task)
    case task.name
    when "Envoyer contrat"
      'contrat_entreprise'
    when "Livrer photos + envoyer facture"
      'galerie_facture_entreprise'
    when "Relancer paiement"
      'relance_paiement_entreprise'
    when "Valider réception solde"
      'reception_facture_entreprise'
    when "Envoyer contrat & facture"
      'facture_contrat_famille'
    when "Confirmer date & lieu"
      'confirmation_lieu_date_famille'
    when "Valider réception contrat signé"
      'reception_contrat_famille'
    when "Envoyer galerie photos"
      'galerie_famille_mariage'
    when "Envoyer contrat & facture 1er acompte"
      'contrat_facture_mariage'
    when "Valider réception contrat & 1er acompte"
      'reception_contrat_mariage'
    when "Envoyer facture 2e acompte"
      'facture_2_mariage'
    when "Valider réception 2e acompte"
      'reception_facture_2_mariage'
    when "Envoyer facture solde"
      'facture_finale_mariage'
    when "Valider réception solde"
     'reception_facture_finale_mariage'
    else
      'no_mail'
    end
  end
end

