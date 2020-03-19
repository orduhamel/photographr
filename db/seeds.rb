require "open-uri"

puts "Deleting all Tasks..."
Task.destroy_all
puts "Deleting all prestations..."
Prestation.destroy_all
puts "Done deleting all Prestations"
puts "Deleting all Clients..."
Client.destroy_all
puts "Done deleting all Clients"
puts "Deleting all Users..."
User.destroy_all
puts "Done deleting all Users"

puts "Implementing the Seeds..."

# owners
puts "Seeding 1 User..."

ophelie_image = File.open(Rails.root.join("db/fixtures/ophelie-raymond-duhamel-avatar.jpg"))
ophelie = User.new(email: 'opheduhamel@gmail.com', password: 'secret', first_name: 'Ophélie', last_name: 'Raymond-Duhamel')
ophelie.photo.attach(io: ophelie_image, filename: "#{ophelie.first_name.downcase}.jpg", content_type: 'image/jpg')
ophelie.save!

puts "Finished seeding 1 user..."

puts "Seeding 8 clients..."

marie_image = File.open(Rails.root.join("db/fixtures/famille.jpg"))
marie = Client.new(first_name: "Marie", last_name: "Mingant", address: "9 rue des lilas Nantes", phone_number: "0789042364", email: "mariemingant@gmail.com", tutoiement: true, partner_name: "Nicolas Laurent", notes: "clients rencontrés dans le cadre d'une prestation famille")
marie.photo.attach(io: marie_image, filename: "#{marie.first_name.downcase}.jpg", content_type: 'image/jpg')
marie.user = ophelie
marie.save!

marine_image = File.open(Rails.root.join("db/fixtures/photo-couple.jpg"))
marine = Client.new(first_name: "Marine", last_name: "Leon", address: "12 rue commandant Groix Nantes", phone_number: "0743890152", email: "marineleon@gmail.com", tutoiement: false, partner_name: "Martin Dupont", notes: "clients rencontrés dans le cadre de leur mariage")
marine.photo.attach(io: marine_image, filename: "#{marine.first_name.downcase}.jpg", content_type: 'image/jpg')
marine.user = ophelie
marine.save!

annaig_image = File.open(Rails.root.join("db/fixtures/was-logo-page-001.jpg"))
annaig = Client.new(first_name: "Annaig", last_name: "Billon", company_name: 'We Are Single', address: "10 Place de l'Église Saint-Sébastien-sur-Loire", phone_number: "0643215698", email: "annaigbillon@gmail.com", tutoiement: true, notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
annaig.photo.attach(io: annaig_image, filename: "#{annaig.first_name.downcase}.jpg", content_type: 'image/jpg')
annaig.user = ophelie
annaig.save!

alexandre_image = File.open(Rails.root.join("db/fixtures/couple-2.jpg"))
alexandre = Client.new(first_name: "Alexandre", last_name: "Facq", address: "1 bis rue Simeon Foucault Nantes", phone_number: "0643215698", email: "alexandrefacq@gmail.com", tutoiement: true, partner_name: "Lili Rat", notes: "La cliente m'a fait appel pour une prestation famille.")
alexandre.photo.attach(io: alexandre_image, filename: "#{alexandre.first_name.downcase}.jpg", content_type: 'image/jpg')
alexandre.user = ophelie
alexandre.save!

camille_image = File.open(Rails.root.join("db/fixtures/le-camion.jpg"))
camille = Client.new(first_name: "Camille", last_name: "Filzi", company_name: 'Le Camion', address: "1 Rue Bayard, 44100 Nantes", phone_number: "0643215698", email: "camillefilzi@gmail.com", tutoiement: true, notes: "La cliente m'a fait appel pour un évènement professionel.", products: "Un grand tirage 60x90 contrecollé sur dibon en caisse américaine")
camille.photo.attach(io: camille_image, filename: "#{camille.first_name.downcase}.jpg", content_type: 'image/jpg')
camille.user = ophelie
camille.save!

gaspard_image = File.open(Rails.root.join("db/fixtures/gaspard-reynaud-emilie-lebec.jpg"))
gaspard = Client.new(first_name: "Gaspard", last_name: "Reynaud", company_name: 'The Tribe', address: "6 rue Victor le Gorgeu, 35000 Rennes", phone_number: "0790328912", email: "gaspardreynaud@gmail.com", tutoiement: true, partner_name: "Emilie Lebec", notes: "Rencontre avec Gaspard le 16 octobre 2019, autour d'une table ronde sur le Web. J'ai rencontré sa fiancée Emilie à un apéro avec Marie Leveque en décembre 2019.")
gaspard.photo.attach(io: gaspard_image, filename: "#{gaspard.first_name.downcase}.jpg", content_type: 'image/jpg')
gaspard.user = ophelie
gaspard.save!

georges_image = File.open(Rails.root.join("db/fixtures/georges-campredon-leonor-desbois.jpg"))
georges = Client.new(first_name: "Georges", last_name: "Campredon", address: "1 rue du Gargot, 47000 Orvault", phone_number: "0732516741", email: "georgescampredon@gmail.com", tutoiement: false, partner_name: "Leonor Desbois", notes: "Georges m'a contacté via Instragram. Il a eu un coup de coeur pour mon style photo. Avec sa fiancée Leonor, ils sont souvent en déplacement et préfèrent les RDV par téléphone. Léonor est une blogueuse beauté et pourrait être intéréssée par une prestation (photos produits).")
georges.photo.attach(io: georges_image, filename: "#{georges.first_name.downcase}.jpg", content_type: 'image/jpg')
georges.user = ophelie
georges.save!

raphaelle_image = File.open(Rails.root.join("db/fixtures/raphaelle-sachot-gregoire-orsoni.jpg"))
raphaelle = Client.new(first_name: "Raphaelle", last_name: "Sachot", address: "33 Rue Nicolas Appert, 44100 Nantes", phone_number: "0634670099", email: "raphaellesachot@gmail.com", tutoiement: false, partner_name: "Grégoire Orsoni", notes: "Maman travaille avec la mère de Raphaëlle, c'est via elle que Raphaelle m'a contacté. Raphaëlle et Grégoire sont ensemble depuis le lycée, ils sont tous les 2 médecins et terminent leurs études l'année prochaine. Très bon premier contact.")
raphaelle.photo.attach(io: raphaelle_image, filename: "#{raphaelle.first_name.downcase}.jpg", content_type: 'image/jpg')
raphaelle.user = ophelie
raphaelle.save!

puts "Finished seeding 8 clients..."


puts "Seeding 10 prestations..."


prestation_famille_leon = Prestation.create!(client: marine, title: "Famille Leon", category: "Famille", start_date: '2020-03-20', end_date: '2020-03-20', location: "12 rue commandant Groix Nantes", notes: "Shooting photo des parents et de leurs 2 enfants chez eux, le temps d'un goûter. Faire attention aux détails de décoration. Les grands-parents seront peut-être présents.", status: 'progress')
prestation_famille_facq = Prestation.create!(client: alexandre, title: "Famille Facq", category: "Famille", start_date: '2020-04-15', end_date: '2020-04-15', location: "265 rue des mouettes Nantes", notes: "Shooting photo des parents et de leur nouveau-né, dans leur jardin et dans la chambre de l'enfant (pièce assez sombre).", status: 'progress')

# prestation_entreprise_lecamion1 = Prestation.create!(client: camille, title: "Entreprise Le Camion", category: "Entreprise", start_date: '2020-01-22', end_date: '2020-01-22', location: "1 Rue Bayard, 44100 Nantes", notes: "Shooting photo des salariés dans le jardin des bureaux de l'entreprise", status: 'finish')
prestation_entreprise_wearesingle = Prestation.create!(client: annaig, title: "Entreprise We Are Single", category: "Entreprise", start_date: '2020-03-13', end_date: '2020-03-13', location: "Restaurant La Table de Yo, 42 Rue de la ville en Bois, 44100 Nantes", notes: "Evénement de rencontre pour célibataires : prendre des photos des groupes, des discussions. RDV à 20h00 au restaurant. Ambiance tamisée (= ne pas oublier de prendre le matériel nécessaire!). Se termine vers 22h00. Repas non compris. ", status: 'progress')
prestation_entreprise_lecamion2 = Prestation.create!(client: camille, title: "Entreprise Filzi", category: "Entreprise", start_date: '2020-04-01', end_date: '2020-04-01', location: "1 Rue Bayard, 44100 Nantes", notes: "Evénement porte-ouverte pour une formation de peinture. Se déroule dans une salle de cours, avec les profs et les potentiels étudiants. Démonstration de peinture. Prendre des photos des groupes de discussion et des démos de peinture.", status: 'progress')
prestation_entreprise_thetribe = Prestation.create!(client: gaspard, title: "Entreprise The Tribe", category: "Entreprise", start_date: '2020-04-22', end_date: '2020-04-24', location: "223 rue du chef de l'île Fédrun, 44720 Saint Joachim", notes: "Seminaire d'entreprise sur 2 jours : photos d'équipe, des activités, des repas (hors dîners). Déplacement et hébergement pris en charge par l'entreprise (Airbnb réservé par l'entreprise, en attente de l'adresse et des détails).", status: 'progress')

prestation_mariage_mingant = Prestation.create!(client: marie, title: "Mariage Mingant", category: "Mariage", start_date: '2020-09-06', end_date: '2020-09-07', location: "29 Rue de Strasbourg Nantes", notes: "mariage à la mairie de Nantes", status: 'progress')
prestation_mariage_reynaud = Prestation.create!(client: gaspard, title: "Mariage Reynaud", category: "Mariage", start_date: '2020-03-27', end_date: '2020-03-28', location: "Domaine du montmarin, Lieu dit le Montmarin, 35730 Pleurtuit", notes: "Les parents de Gaspard habitent à Saint Malo. 320 personnes invitées, mariage élégant et assez mondain. Cocktail à l'extérieur et à l'intérieur, dîner dans L'Orangerie. Contacter la témoin Fanny (0612321187) pour les détails du jour J.", status: 'progress')
prestation_mariage_campredon = Prestation.create!(client: georges, title: "Mariage Campredon", category: "Mariage", start_date: '2020-04-17', end_date: '2020-04-17', location: "Domaine de la Pinelais, La Pinelais, 44320 Saint-Père-en-Retz", notes: "80 personnes invitées, mariage champêtre avec une cérémonie laïque à 15h dans le jardin du domaine. Cocktail extérieur et dîner à l'intérieur. Porter une attention particulière aux détails, à la décoration, aux fleurs. La fille est très proche de sa soeur aînée, Margaux, qui est sa seule témoin.", status: 'progress')
prestation_mariage_sachot = Prestation.create!(client: raphaelle, title: "Mariage Sachot", category: "Mariage", start_date: '2020-05-16', end_date: '2020-05-17', location: "Château de Trédion, 1 Rue du Château, 56250 Trédion", notes: "130 personnes invitées. Mariage franco-canadien, la famille de Grégoire habite au Canada, ils sont aussi originaires de Corse. Cérémonie à l'église à 15h30, cocktail dans le domaine. Prendre pas mal de photos de petits groupes (copains et famille). Dîner sous forme de buffet à l'extérieur. Déco et fleurs +++", status: 'progress')

prestation_entreprise_lecamion1_image = File.open(Rails.root.join("db/fixtures/gallery-le-camion.jpg"))
prestation_entreprise_lecamion1 = Prestation.new(client: camille, title: "Entreprise Le Camion", category: "Entreprise", start_date: '2020-01-22', end_date: '2020-01-22', location: "1 Rue Bayard, 44100 Nantes", notes: "Shooting photo des salariés dans le jardin des bureaux de l'entreprise", status: 'finish')
prestation_entreprise_lecamion1.photo.attach(io: prestation_entreprise_lecamion1_image, filename: "#{prestation_entreprise_lecamion1.title.downcase}.jpg", content_type: 'image/jpg')
prestation_entreprise_lecamion1.save!

puts "Finished seeding 10 prestations..."


puts "Creating 10 groups of tasks..."

#milestones mariage Mingant

task1_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer contrat & facture 1er acompte",
                        kind: "admin",
                        urgent: false,
                        start_date: Date.new(2019,8,10),
                        end_date: Date.new(2019,8,10))

task2_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception contrat & 1er acompte",
                        kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                        urgent: false,
                        start_date: Date.new(2019,8,17),
                        end_date: Date.new(2019,8,17))

task3_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Fixer le 1er rendez-vous",
                        kind: "admin",
                        description: "A faire si je n'ai pas déjà rencontré les clients",
                        urgent: false, start_date: Date.new(2019,10,27),
                        end_date: Date.new(2019,10,27))

task4_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer facture 2e acompte",
                        kind: "admin",
                        urgent: false,
                        start_date: Date.new(2020,3,10),
                        end_date: Date.new(2020,3,10))

task5_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception 2e acompte",
                        kind: "admin",
                        description: "Si l'acompte n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: Date.new(2020,3,19),
                        end_date: Date.new(2020,3,19))

task6_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "1ere rencontre",
                        kind: "rendez-vous",
                        description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                        urgent: false,
                        start_date: Date.new(2020,3,19),
                        end_date: Date.new(2020,3,19))

task7_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Réserver logement & transport",
                        kind: "admin",
                        description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                        urgent: false,
                        start_date: Date.new(2020,7,8),
                        end_date: Date.new(2020,7,8))

task8_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "2e rencontre",
                        kind: "rendez-vous",
                        description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                        urgent: false,
                        start_date: Date.new(2020,8,6),
                        end_date: Date.new(2020,8,6))

task9_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer facture solde",
                        kind: "admin",
                        description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                        urgent: false,
                        start_date: Date.new(2020,8,22),
                        end_date: Date.new(2020,8,22))
task10_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception solde",
                        kind: "admin",
                        description: "Si le solde n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_date: Date.new(2020,8,31),
                        end_date: Date.new(2020,8,31))

task11_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Évènement",
                        kind: "évènement",
                        urgent: false,
                        start_date: Date.new(2020,9,6),
                        end_date: Date.new(2020,9,7))

task12_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Post-traitement des photos",
                        kind: "créa",
                        description: "Marge de 28 jours max pour traiter les photos",
                        urgent: false,
                        start_date: Date.new(2020,9,9),
                        end_date: Date.new(2020,9,14))

task13_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer galerie photos",
                        kind: "admin",
                        description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                        urgent: false,
                        start_date: Date.new(2020,10,7),
                        end_date: Date.new(2020,10,7))

task14_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer support(s) photos",
                        kind: "admin",
                        description: "Par courrier",
                        urgent: false,
                        start_date: Date.new(2020,9,17),
                        end_date: Date.new(2020,9,17))


#milestones mariage Reyanud

task1_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Envoyer contrat & facture 1er acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2019,4,27),
                    end_date: Date.new(2019,4,27))

task2_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Valider réception contrat & 1er acompte",
                    kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                    urgent: false,
                    start_date: Date.new(2019,4,27) + 7.days,
                    end_date: Date.new(2019,4,27) + 7.days)

task3_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Fixer le 1er rendez-vous",
                    kind: "admin",
                    description: "A faire si je n'ai pas déjà rencontré les clients",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 200.days,
                    end_date: Date.new(2020,3,27) - 200.days)

task4_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Envoyer facture 2e acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 180.days,
                    end_date: Date.new(2020,3,27) - 180.days)

task5_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Valider réception 2e acompte",
                    kind: "admin",
                    description: "Si l'acompte n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 170.days,
                    end_date: Date.new(2020,3,27) - 170.days)

task6_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "1ere rencontre",
                    kind: "rendez-vous",
                    description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 170.days,
                    end_date: Date.new(2020,3,27) - 170.days)

task7_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Réserver logement & transport",
                    kind: "admin",
                    description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 60.days,
                    end_date: Date.new(2020,3,27) - 60.days)

task8_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "2e rencontre",
                    kind: "rendez-vous",
                    description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 30.days,
                    end_date: Date.new(2020,3,27) - 30.days)

task9_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Envoyer facture solde",
                    kind: "admin",
                    description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 15.days,
                    end_date: Date.new(2020,3,27) - 15.days)
task10_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Valider réception solde",
                    kind: "admin",
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,3,27) - 7.days,
                    end_date: Date.new(2020,3,27) - 7.days)

task11_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Évènement",
                    kind: "évènement",
                    urgent: false,
                    start_date: Date.new(2020,3,27),
                    end_date: Date.new(2020,3,28))

task12_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Post-traitement des photos",
                    kind: "créa",
                    description: "Marge de 28 jours max pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 2.days,
                    end_date: Date.new(2020,3,28) + 5.days)

task13_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Envoyer galerie photos",
                    kind: "admin",
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 30.days,
                    end_date: Date.new(2020,3,28) + 30.days)

task14_mariage_reynaud = Task.create!(
                    prestation: prestation_mariage_reynaud,
                    name: "Envoyer support(s) photos",
                    kind: "admin",
                    description: "Par courrier",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 40.days,
                    end_date: Date.new(2020,3,28) + 40.days)

#milestones mariage Campredon

task1_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Envoyer contrat & facture 1er acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2019,5,12),
                    end_date: Date.new(2019,5,12))

task2_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Valider réception contrat & 1er acompte",
                    kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                    urgent: false,
                    start_date: Date.new(2019,5,12) + 7.days,
                    end_date: Date.new(2019,5,12) + 7.days)

task3_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Fixer le 1er rendez-vous",
                    kind: "admin",
                    description: "A faire si je n'ai pas déjà rencontré les clients",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 200.days,
                    end_date: Date.new(2020,4,17) - 200.days)

task4_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Envoyer facture 2e acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 180.days,
                    end_date: Date.new(2020,4,17) - 180.days)

task5_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Valider réception 2e acompte",
                    kind: "admin",
                    description: "Si l'acompte n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 170.days,
                    end_date: Date.new(2020,4,17) - 170.days)

task6_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "1ere rencontre",
                    kind: "rendez-vous",
                    description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 170.days,
                    end_date: Date.new(2020,4,17) - 170.days)

task7_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Réserver logement & transport",
                    kind: "admin",
                    description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 60.days,
                    end_date: Date.new(2020,4,17) - 60.days)

task8_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "2e rencontre",
                    kind: "rendez-vous",
                    description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 30.days,
                    end_date: Date.new(2020,4,17) - 30.days)

task9_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Envoyer facture solde",
                    kind: "admin",
                    description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 15.days,
                    end_date: Date.new(2020,4,17) - 15.days)
task10_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Valider réception solde",
                    kind: "admin",
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,4,17) - 7.days,
                    end_date: Date.new(2020,4,17) - 7.days)

task11_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Évènement",
                    kind: "évènement",
                    urgent: false,
                    start_date: Date.new(2020,4,17),
                    end_date: Date.new(2020,4,17))

task12_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Post-traitement des photos",
                    kind: "créa",
                    description: "Marge de 28 jours max pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 2.days,
                    end_date: Date.new(2020,3,28) + 5.days)

task13_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Envoyer galerie photos",
                    kind: "admin",
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 30.days,
                    end_date: Date.new(2020,3,28) + 30.days)

task14_mariage_campredon = Task.create!(
                    prestation: prestation_mariage_campredon,
                    name: "Envoyer support(s) photos",
                    kind: "admin",
                    description: "Par courrier",
                    urgent: false,
                    start_date: Date.new(2020,3,28) + 40.days,
                    end_date: Date.new(2020,3,28) + 40.days)

#milestones mariage Sachot

task1_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Envoyer contrat & facture 1er acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2019,5,27),
                    end_date: Date.new(2019,5,27))

task2_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Valider réception contrat & 1er acompte",
                    kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                    urgent: false,
                    start_date: Date.new(2019,5,27) + 7.days,
                    end_date: Date.new(2019,5,27) + 7.days)

task3_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Fixer le 1er rendez-vous",
                    kind: "admin",
                    description: "A faire si je n'ai pas déjà rencontré les clients",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 200.days,
                    end_date: Date.new(2020,5,16) - 200.days)

task4_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Envoyer facture 2e acompte",
                    kind: "admin",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 180.days,
                    end_date: Date.new(2020,5,16) - 180.days)

task5_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Valider réception 2e acompte",
                    kind: "admin",
                    description: "Si l'acompte n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 170.days,
                    end_date: Date.new(2020,5,16) - 170.days)

task6_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "1ere rencontre",
                    kind: "rendez-vous",
                    description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 170.days,
                    end_date: Date.new(2020,5,16) - 170.days)

task7_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Réserver logement & transport",
                    kind: "admin",
                    description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 60.days,
                    end_date: Date.new(2020,5,16) - 60.days)

task8_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "2e rencontre",
                    kind: "rendez-vous",
                    description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 30.days,
                    end_date: Date.new(2020,5,16) - 30.days)

task9_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Envoyer facture solde",
                    kind: "admin",
                    description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 15.days,
                    end_date: Date.new(2020,5,16) - 15.days)
task10_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Valider réception solde",
                    kind: "admin",
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,5,16) - 7.days,
                    end_date: Date.new(2020,5,16) - 7.days)

task11_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Évènement",
                    kind: "évènement",
                    urgent: false,
                    start_date: Date.new(2020,5,16),
                    end_date: Date.new(2020,5,17))

task12_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Post-traitement des photos",
                    kind: "créa",
                    description: "Marge de 28 jours max pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,5,17) + 2.days,
                    end_date: Date.new(2020,5,17) + 5.days)

task13_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Envoyer galerie photos",
                    kind: "admin",
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                    urgent: false,
                    start_date: Date.new(2020,5,17) + 30.days,
                    end_date: Date.new(2020,5,17) + 30.days)

task14_mariage_sachot = Task.create!(
                    prestation: prestation_mariage_sachot,
                    name: "Envoyer support(s) photos",
                    kind: "admin",
                    description: "Par courrier",
                    urgent: false,
                    start_date: Date.new(2020,5,17) + 40.days,
                    end_date: Date.new(2020,5,17) + 40.days)

#milestones famille leon

task1_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer contrat & facture",
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,2,28),
                    end_date: Date.new(2020,2,28))
task2_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Valider réception contrat signé",
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,3,5),
                    end_date: Date.new(2020,3,5))
task3_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Confirmer date & lieu",
                    kind: 'admin',
                    description: "Contacter la famille",
                    urgent: false,
                    start_date: Date.new(2020,3,13),
                    end_date: Date.new(2020,3,13))
task4_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Évènement",
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,3,19),
                    end_date: Date.new(2020,3,19))
task5_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Recevoir solde total",
                    kind: 'admin',
                    description: "A recevoir au moment de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,3,19),
                    end_date: Date.new(2020,3,19))
task6_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Post-traitement",
                    kind: 'créa',
                    description: "Marge de 30 jours max pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,3,21),
                    end_date: Date.new(2020,3,21))
task7_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer galerie photos",
                    kind: 'admin',
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé) ",
                    urgent: false,
                    start_date: Date.new(2020,4,20),
                    end_date: Date.new(2020,4,20))
task8_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer support(s) photo",
                    kind: 'admin',
                    description: "Par courrier",
                    urgent: false,
                    start_date: Date.new(2020,4,30),
                    end_date: Date.new(2020,4,30))



#milestones famille Facq

task1_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer contrat & facture",
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,3,14),
                    end_date: Date.new(2020,3,14))
task2_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Valider réception contrat signé",
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,3,21),
                    end_date: Date.new(2020,3,21))
task3_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Confirmer date & lieu",
                    kind: 'admin',
                    description: "Contacter la famille",
                    urgent: false,
                    start_date: Date.new(2020,4,8),
                    end_date: Date.new(2020,4,8))
task4_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Évènement",
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,4,15),
                    end_date: Date.new(2020,4,15))
task5_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Recevoir solde total",
                    kind: 'admin',
                    description: "A recevoir au moment de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,4,15),
                    end_date: Date.new(2020,4,15))
task6_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Post-traitement des photos",
                    kind: 'créa',
                    description: "Marge de 30 jours max pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,4,16),
                    end_date: Date.new(2020,4,16))
task7_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer galerie photos",
                    kind: 'admin',
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé) ",
                    urgent: false,
                    start_date: Date.new(2020,5,15),
                    end_date: Date.new(2020,5,15))
task8_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer support(s) photo",
                    kind: 'admin',
                    description: "Par courrier",
                    urgent: false,
                    start_date: Date.new(2020,5,25),
                    end_date: Date.new(2020,5,25))


# Milestones entreprise Le Camion 1

task1_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2019,12,10),
                    end_date: Date.new(2019,12,10))

task2_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2019,12,10) + 3.days,
                    end_date: Date.new(2019,12,10) + 3.days)

task3_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Brief',
                    kind: 'rendez-vous',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,1,22) - 7.days,
                    end_date: Date.new(2020,1,22) - 7.days)

task4_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,1,22),
                    end_date: Date.new(2020,1,22))

task5_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,1,22) + 1.day,
                    end_date: Date.new(2020,1,22) + 1.day)

task6_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,1,22) + 7.days,
                    end_date: Date.new(2020,1,22) + 7.days)

task7_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,1,22) + 30.days,
                    end_date: Date.new(2020,1,22) + 30.days)

task8_entreprise_lecamion1 = Task.create!(
                    prestation: prestation_entreprise_lecamion1,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,1,22) + 45.days,
                    end_date: Date.new(2020,1,22) + 45.days)


#milestones entreprise Le Camion 2

task1_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,3,10),
                    end_date: Date.new(2020,3,10))

task2_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,3,13),
                    end_date: Date.new(2020,3,13))

task3_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Brief',
                    kind: 'rendez-vous',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,3,26),
                    end_date: Date.new(2020,3,26))

task4_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,4,1),
                    end_date: Date.new(2020,4,1))

task5_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,4,2),
                    end_date: Date.new(2020,4,2))

task6_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,4,8),
                    end_date: Date.new(2020,4,8))

task7_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,5,1),
                    end_date: Date.new(2020,5,1))

task8_entreprise_lecamion2 = Task.create!(
                    prestation: prestation_entreprise_lecamion2,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,5,16),
                    end_date: Date.new(2020,5,16))


#milestones entreprise We Are Single

task1_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,2,26),
                    end_date: Date.new(2020,2,26))

task2_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,2,29),
                    end_date: Date.new(2020,2,29))

task3_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Brief',
                    kind: 'rendez-vous',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,3,6),
                    end_date: Date.new(2020,3,6))

task4_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,3,13),
                    end_date: Date.new(2020,3,13))

task5_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,3,14),
                    end_date: Date.new(2020,3,14))

task6_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,3,21),
                    end_date: Date.new(2020,3,21))

task7_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,4,20),
                    end_date: Date.new(2020,4,20))

task8_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,5,3),
                    end_date: Date.new(2020,5,3))



# Milestones entreprise The Tribe

task1_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,3,18),
                    end_date: Date.new(2020,3,18))

task2_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client lors du RDV (1ère rencontre)",
                    urgent: false,
                    start_date: Date.new(2020,3,18) + 3.days,
                    end_date: Date.new(2020,3,18) + 3.days)

task3_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Brief',
                    kind: 'rendez-vous',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_date: Date.new(2020,4,22) - 7.days,
                    end_date: Date.new(2020,4,22) - 7.days)

task4_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_date: Date.new(2020,4,22),
                    end_date: Date.new(2020,4,24))

task5_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_date: Date.new(2020,4,24) + 1.day,
                    end_date: Date.new(2020,4,24) + 1.day)

task6_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,4,24) + 7.days,
                    end_date: Date.new(2020,4,24) + 7.days)

task7_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_date: Date.new(2020,4,24) + 30.days,
                    end_date: Date.new(2020,4,24) + 30.days)

task8_entreprise_thetribe = Task.create!(
                    prestation: prestation_entreprise_thetribe,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_date: Date.new(2020,4,24) + 45.days,
                    end_date: Date.new(2020,4,24) + 45.days)

puts "Finished creating 10 group of tasks..."

puts "__________________________________________________________"
puts "Finished Seeding!"
