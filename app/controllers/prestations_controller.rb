class PrestationsController < ApplicationController
  before_action :set_prestation, only: %i[show edit update finish]

  def index
    @prestations = Prestation.joins(:client).where(clients: { user_id: current_user.id }).order(status: :desc).order(:start_date)
  end

  def show; end

  def new
    @prestation = Prestation.new
    @display_client_names = Client.order(:last_name).map do |client|
      client_company = client.company_name.nil? ? "" : " (Entreprise: '#{client.company_name}')"
      client_name = client.first_name + " " + client.last_name += client_company
      [client_name, client.id]
    end
    @prestation.build_client
  end

  def create
    @prestation = Prestation.new(prestation_params)

    if @prestation.category == 'Entreprise'
      @prestation.title = "#{@prestation.category} #{@prestation.client.company_name}"
    else
      @prestation.title = "#{@prestation.category} #{@prestation.client.last_name}"
    end

    @prestation.client.user = current_user

    if @prestation.save

      if @prestation.category == 'Mariage'
        create_mariage_tasks(@prestation, @prestation.start_date, @prestation.end_date)
      elsif @prestation.category == 'Entreprise'
        create_entreprise_tasks(@prestation, @prestation.start_date, @prestation.end_date)
      elsif @prestation.category == 'Famille'
        create_famille_tasks(@prestation, @prestation.start_date, @prestation.end_date)
      end

      redirect_to prestation_path(@prestation)
    else
      render :new
    end
  end

  def finish
    @prestation.update(status: "finish")
    redirect_to prestation_path
  end

  def edit; end

  def update
    @prestation.update(prestation_params)
    # @prestation.tasks.destroy_all

    # if @prestation.category == 'Mariage'
    #   create_mariage_tasks(@prestation, @prestation.start_date, @prestation.end_date)
    # elsif @prestation.category == 'Entreprise'
    #   create_entreprise_tasks(@prestation, @prestation.start_date, @prestation.end_date)
    # elsif @prestation.category == 'Famille'
    #   create_famille_tasks(@prestation, @prestation.start_date, @prestation.end_date)
    # end

    if @prestation.save
    redirect_to prestation_path(@prestation)

    else
      render :edit
    end
  end

  private

  def set_prestation
    @prestation = current_user.prestations.find(params[:id])
  end

  def prestation_params
    params.require(:prestation).permit(:category, :location, :notes, :start_date, :end_date, :client_id, client_attributes: [:id, :first_name, :last_name, :address, :phone_number, :email, :tutoiement, :partner_name, :notes, :photo])
  end

  def create_famille_tasks(prestation, event_start_date, event_end_date)
    task1_famille = Task.create!(
                        prestation: prestation,
                        name: "Envoyer contrat & facture",
                        kind: 'admin',
                        urgent: false,
                        start_date: Date.today,
                        end_date: Date.today)
    task2_famille = Task.create!(
                        prestation: prestation,
                        name: "Valider réception contrat signé",
                        kind: 'admin',
                        description: "Si le document n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: Date.today + 7.days,
                        end_date: Date.today + 7.days)
    task3_famille = Task.create!(
                        prestation: prestation,
                        name: "Confirmer date & lieu",
                        kind: 'admin',
                        description: "Contacter la famille",
                        urgent: false,
                        start_date: event_start_date - 7.days,
                        end_date: event_start_date - 7.days)
    task4_famille = Task.create!(
                        prestation: prestation,
                        name: "Évènement",
                        kind: 'évènement',
                        urgent: false,
                        start_date: event_start_date,
                        end_date: event_end_date)
    task5_famille = Task.create!(
                        prestation: prestation,
                        name: "Recevoir solde total",
                        kind: 'admin',
                        description: "A recevoir au moment de la prestation",
                        urgent: false,
                        start_date: event_end_date,
                        end_date: event_end_date)
    task6_famille = Task.create!(
                        prestation: prestation,
                        name: "Post-traitement",
                        kind: 'créa',
                        description: "Marge de 30 jours max pour traiter les photos",
                        urgent: false,
                        start_date: event_end_date + 1.day,
                        end_date: event_end_date + 1.day)
    task7_famille = Task.create!(
                        prestation: prestation,
                        name: "Envoyer galerie photos",
                        kind: 'admin',
                        description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé) ",
                        urgent: false,
                        start_date: event_end_date + 30.days,
                        end_date: event_end_date + 30.days)
    task8_famille = Task.create!(
                        prestation: prestation,
                        name: "Envoyer support(s) photo",
                        kind: 'admin',
                        description: "Par courrier",
                        urgent: false,
                        start_date: event_end_date + 40.days,
                        end_date: event_end_date + 40.days)
  end

  def create_entreprise_tasks(prestation, event_start_date, event_end_date)
    task1_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Envoyer contrat',
                        kind: 'admin',
                        urgent: false,
                        start_date: Date.today,
                        end_date: Date.today)

    task2_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Valider réception contrat signé',
                        kind: 'admin',
                        description: "Si le document n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: Date.today + 3.days,
                        end_date: Date.today + 3.days)

    task3_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Brief',
                        kind: 'rendez-vous',
                        description: "Discussion avec le client sur le brief de la prestation",
                        urgent: false,
                        start_date: event_start_date - 7.days,
                        end_date: event_start_date - 7.days)

    task4_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Évènement',
                        kind: 'évènement',
                        urgent: false,
                        start_date: event_start_date,
                        end_date: event_end_date)

    task5_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Post-traitement',
                        kind: 'créa',
                        description: "Marge de 7 jours pour traiter les photos",
                        urgent: false,
                        start_date: event_end_date + 1.day,
                        end_date: event_end_date + 1.day)

    task6_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Livrer photos + envoyer facture',
                        kind: 'admin',
                        urgent: false,
                        start_date: event_end_date + 7.days,
                        end_date: event_end_date + 7.days)

    task7_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Relancer paiement',
                        kind: 'admin',
                        urgent: false,
                        start_date: event_end_date + 30.days,
                        end_date: event_end_date + 30.days)

    task8_entreprise = Task.create!(
                        prestation: prestation,
                        name: 'Valider réception solde',
                        kind: 'admin',
                        description: "Si le solde n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: event_end_date + 45.days,
                        end_date: event_end_date + 45.days)
  end

  def create_mariage_tasks(prestation, event_start_date, event_end_date)
    task1_mariage = Task.create!(
                        prestation: prestation,
                        name: "Envoyer contrat & facture 1er acompte",
                        kind: "admin",
                        urgent: false,
                        start_date: Date.today,
                        end_date: Date.today)

    task2_mariage = Task.create!(
                        prestation: prestation,
                        name: "Valider réception contrat & 1er acompte",
                        kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                        urgent: false,
                        start_date: Date.today + 7.days,
                        end_date: Date.today + 7.days)

    task3_mariage = Task.create!(
                        prestation: prestation,
                        name: "Fixer le 1er rendez-vous",
                        kind: "admin",
                        description: "A faire si je n'ai pas déjà rencontré les clients",
                        urgent: false,
                        start_date: event_start_date - 200.days,
                        end_date: event_start_date - 200.days)

    task4_mariage = Task.create!(
                        prestation: prestation,
                        name: "Envoyer facture 2e acompte",
                        kind: "admin",
                        urgent: false,
                        start_date: event_start_date - 180.days,
                        end_date: event_start_date - 180.days)

    task5_mariage = Task.create!(
                        prestation: prestation,
                        name: "Valider réception 2e acompte",
                        kind: "admin",
                        description: "Si l'acompte n'a pas été reçu : relancer le client lors du RDV (1ère rencontre)",
                        urgent: false,
                        start_date: event_start_date - 170.days,
                        end_date: event_start_date - 170.days)

    task6_mariage = Task.create!(
                        prestation: prestation,
                        name: "1ere rencontre",
                        kind: "rendez-vous",
                        description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                        urgent: false,
                        start_date: event_start_date - 170.days,
                        end_date: event_start_date - 170.days)

    task7_mariage = Task.create!(
                        prestation: prestation,
                        name: "Réserver logement & transport",
                        kind: "admin",
                        description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                        urgent: false,
                        start_date: event_start_date - 60.days,
                        end_date: event_start_date - 60.days)

    task8_mariage = Task.create!(
                        prestation: prestation,
                        name: "2e rencontre",
                        kind: "rendez-vous",
                        description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                        urgent: false,
                        start_date: event_start_date - 30.days,
                        end_date: event_start_date - 30.days)

    task9_mariage = Task.create!(
                        prestation: prestation,
                        name: "Envoyer facture solde",
                        kind: "admin",
                        description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                        urgent: false,
                        start_date: event_start_date - 15.days,
                        end_date: event_start_date - 15.days)
    task10_mariage = Task.create!(
                        prestation: prestation,
                        name: "Valider réception solde",
                        kind: "admin",
                        description: "Si le solde n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: event_start_date - 7.days,
                        end_date: event_start_date - 7.days)

    task11_mariage = Task.create!(
                        prestation: prestation,
                        name: "Évènement",
                        kind: "évènement",
                        urgent: false,
                        start_date: event_start_date,
                        end_date: event_end_date)

    task12_mariage = Task.create!(
                        prestation: prestation,
                        name: "Post-traitement des photos",
                        kind: "créa",
                        description: "Marge de 28 jours max pour traiter les photos",
                        urgent: false,
                        start_date: event_end_date + 2.days,
                        end_date: event_end_date + 5.days)

    task13_mariage = Task.create!(
                        prestation: prestation,
                        name: "Envoyer galerie photos",
                        kind: "admin",
                        description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                        urgent: false,
                        start_date: event_end_date + 30.days,
                        end_date: event_end_date + 30.days)

    task14_mariage = Task.create!(
                        prestation: prestation,
                        name: "Envoyer support(s) photos",
                        kind: "admin",
                        description: "Par courrier",
                        urgent: false,
                        start_date: event_end_date + 40.days,
                        end_date: event_end_date + 40.days)
  end
end
