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

puts "Seeding 3 clients..."

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
alexandre = Client.new(first_name: "Alexandre", last_name: "Facq", address: "1 bis rue Simeon Foucault Nantes", phone_number: "0643215698", email: "alexandrefacq@gmail.com", tutoiement: true, partner_name: "Lili Rat", notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
alexandre.photo.attach(io: alexandre_image, filename: "#{alexandre.first_name.downcase}.jpg", content_type: 'image/jpg')
alexandre.user = ophelie
alexandre.save!

camille_image = File.open(Rails.root.join("db/fixtures/le-camion.jpg"))
camille = Client.new(first_name: "Camille", last_name: "Filzi", company_name: 'Le Camion', address: "1 Rue Bayard, 44100 Nantes", phone_number: "0643215698", email: "camillefilzi@gmail.com", tutoiement: true, notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
camille.photo.attach(io: camille_image, filename: "#{camille.first_name.downcase}.jpg", content_type: 'image/jpg')
camille.user = ophelie
camille.save!

puts "Finished seeding 3 clients..."


puts "Seeding 3 prestations..."

prestation_famille_leon = Prestation.create!(client: marine, title: "Famille Leon", category: "Famille", location: "12 rue commandant Groix Nantes", notes: "prestation famille. Ils ont deux enfants", status: "en cours")
prestation_mariage_mingant = Prestation.create!(client: marie, title: "Mariage Mingant Laurent", category: "Mariage", location: "29 Rue de Strasbourg Nantes", notes: "mariage à la mairie de Nantes", status: "En cours")
prestation_entreprise_wearesingle = Prestation.create!(client: annaig, title: "Entreprise We Are Single", category: "Entreprise", location: "24 Rue de la Noé Cottee Saint-Sébastien-sur-Loire", notes: "événement de rencontre pour célibataires.", status: "En cours")
prestation_famille_facq = Prestation.create!(client: alexandre, title: "Famille Facq", category: "Famille", location: "12 rue commandant Groix Nantes", notes: "prestation famille. Ils ont un enfant", status: "en cours")
prestation_entreprise_lecamion = Prestation.create!(client: camille, title: "Entreprise Le Camion", category: "Entreprise", location: "1 Rue Bayard, 44100 Nantes", notes: "événement porte ouverte formation peinture.", status: "En cours")

puts "Finished seeding 3 prestations..."


puts "Creating 3 group of tasks..."

#milestones mariage

task1_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer contrat & facture 1er acompte",
                        kind: "admin",
                        urgent: false,
                        start_time: DateTime.new(2019,8,10),
                        end_time: DateTime.new(2019,8,10))

task2_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception contrat & 1er acompte",
                        kind: "admin", description: "Si les documents et l'acompte n'ont pas été reçus : relancer le client",
                        urgent: false,
                        start_time: DateTime.new(2019,8,17),
                        end_time: DateTime.new(2019,8,17))

task3_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Fixer le 1er rendez-vous",
                        kind: "admin",
                        description: "A faire si je n'ai pas déjà rencontré les clients",
                        urgent: false, start_time: DateTime.new(2019,10,27),
                        end_time: DateTime.new(2019,10,27))

task4_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer facture 2e acompte",
                        kind: "admin",
                        urgent: false,
                        start_time: DateTime.new(2020,3,10),
                        end_time: DateTime.new(2020,3,10))

task5_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception 2e acompte",
                        kind: "admin",
                        description: "Si l'acompte n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_time: DateTime.new(2020,3,20),
                        end_time: DateTime.new(2020,3,20))

task6_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "1ere rencontre",
                        kind: "rendez-vous",
                        description: "Définition des attentes du client + apprendre à les connaître. A faire si je n'ai pas déjà rencontré les clients. Définir si c'est un RDV physique ou un appel téléphone.",
                        urgent: false,
                        start_time: DateTime.new(2020,3,20),
                        end_time: DateTime.new(2020,3,20))

task7_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Réserver logement & transport",
                        kind: "admin",
                        description: "- Echanges de mails pour prendre billets train/avion + location voiture + hébergement.- Demande de remboursement avance des frais (tant que je suis autoentrepreneur).",
                        urgent: false,
                        start_time: DateTime.new(2020,7,8),
                        end_time: DateTime.new(2020,7,8))

task8_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "2e rencontre",
                        kind: "rendez-vous",
                        description: "Ne pas oublier de demander : - Le trombinoscope - Des précisions quant au planning du jour J",
                        urgent: false,
                        start_time: DateTime.new(2020,8,6),
                        end_time: DateTime.new(2020,8,6))

task9_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer facture solde",
                        kind: "admin",
                        description: "Facture du solde à payer au plus tard 7 jours avant le jour J",
                        urgent: false,
                        start_time: DateTime.new(2020,8,22),
                        end_time: DateTime.new(2020,8,22))
task10_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Valider réception solde",
                        kind: "admin",
                        description: "Si le solde n'a pas été reçu : relancer le client",
                        urgent: false,
                        start_time: DateTime.new(2020,8,31),
                        end_time: DateTime.new(2020,8,31))

task11_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Évènement",
                        kind: "évènement",
                        urgent: false,
                        start_time: DateTime.new(2020,9,6),
                        end_time: DateTime.new(2020,9,7))

task12_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Post-traitement des photos",
                        kind: "créa",
                        description: "Marge de 28 jours max pour traiter les photos",
                        urgent: false,
                        start_time: DateTime.new(2020,9,9),
                        end_time: DateTime.new(2020,9,14))

task13_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer galerie photos",
                        kind: "admin",
                        description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé)",
                        urgent: false,
                        start_time: DateTime.new(2020,10,7),
                        end_time: DateTime.new(2020,10,7))

task14_mariage_mingant = Task.create!(
                        prestation: prestation_mariage_mingant,
                        name: "Envoyer support(s) photos",
                        kind: "admin",
                        description: "Par courrier",
                        urgent: false,
                        start_time: DateTime.new(2020,9,17),
                        end_time: DateTime.new(2020,9,17))


#milestones famille leon

task1_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer contrat & facture",
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,2,28),
                    end_time: DateTime.new(2020,2,28))
task2_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Valider réception contrat signé",
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,3,5),
                    end_time: DateTime.new(2020,3,5))
task3_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Confirmer date & lieu",
                    kind: 'admin',
                    description: "Contacter la famille",
                    urgent: false,
                    start_time: DateTime.new(2020,3,13),
                    end_time: DateTime.new(2020,3,13))
task4_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Évènement",
                    kind: 'évènement',
                    urgent: false,
                    start_time: DateTime.new(2020,3,20),
                    end_time: DateTime.new(2020,3,20))
task5_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Recevoir solde total",
                    kind: 'admin',
                    description: "A recevoir au moment de la prestation",
                    urgent: false,
                    start_time: DateTime.new(2020,3,20),
                    end_time: DateTime.new(2020,3,20))
task6_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Post-traitement",
                    kind: 'créa',
                    description: "Marge de 30 jours max pour traiter les photos",
                    urgent: false,
                    start_time: DateTime.new(2020,3,21),
                    end_time: DateTime.new(2020,3,21))
task7_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer galerie photos",
                    kind: 'admin',
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé) ",
                    urgent: false,
                    start_time: DateTime.new(2020,4,20),
                    end_time: DateTime.new(2020,4,20))
task8_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer support(s) photo",
                    kind: 'admin',
                    description: "Par courrier",
                    urgent: false,
                    start_time: DateTime.new(2020,4,30),
                    end_time: DateTime.new(2020,4,30))



#milestones entreprise We Are Single

task1_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,3,9),
                    end_time: DateTime.new(2020,3,9))

task2_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,3,12),
                    end_time: DateTime.new(2020,3,12))

task3_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Brief',
                    kind: 'rendez-vous',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_time: DateTime.new(2020,3,16),
                    end_time: DateTime.new(2020,3,16))

task4_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_time: DateTime.new(2020,3,23),
                    end_time: DateTime.new(2020,3,23))

task5_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_time: DateTime.new(2020,3,24),
                    end_time: DateTime.new(2020,3,24))

task6_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,3,30),
                    end_time: DateTime.new(2020,3,30))

task7_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,4,29),
                    end_time: DateTime.new(2020,4,29))

task8_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,5,14),
                    end_time: DateTime.new(2020,5,14))

#milestones famille leon

task1_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer contrat & facture",
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,3,14),
                    end_time: DateTime.new(2020,3,14))
task2_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Valider réception contrat signé",
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,3,21),
                    end_time: DateTime.new(2020,3,21))
task3_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Confirmer date & lieu",
                    kind: 'admin',
                    description: "Contacter la famille",
                    urgent: false,
                    start_time: DateTime.new(2020,4,8),
                    end_time: DateTime.new(2020,4,8))
task4_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Évènement",
                    kind: 'évènement',
                    urgent: false,
                    start_time: DateTime.new(2020,4,15),
                    end_time: DateTime.new(2020,4,15))
task5_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Recevoir solde total",
                    kind: 'admin',
                    description: "A recevoir au moment de la prestation",
                    urgent: false,
                    start_time: DateTime.new(2020,4,15),
                    end_time: DateTime.new(2020,4,15))
task6_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Post-traitement des photos",
                    kind: 'créa',
                    description: "Marge de 30 jours max pour traiter les photos",
                    urgent: false,
                    start_time: DateTime.new(2020,4,16),
                    end_time: DateTime.new(2020,4,16))
task7_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer galerie photos",
                    kind: 'admin',
                    description: "Envoyer la galerie en ligne par mail (avec les codes d’accès et le fonctionnement de leur accès privé) ",
                    urgent: false,
                    start_time: DateTime.new(2020,5,15),
                    end_time: DateTime.new(2020,5,15))
task8_famille_facq = Task.create!(
                    prestation: prestation_famille_facq,
                    name: "Envoyer support(s) photo",
                    kind: 'admin',
                    description: "Par courrier",
                    urgent: false,
                    start_time: DateTime.new(2020,5,25),
                    end_time: DateTime.new(2020,5,25))



#milestones entreprise Le Camion

task1_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Envoyer contrat',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,3,19),
                    end_time: DateTime.new(2020,3,19))

task2_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Valider réception contrat signé',
                    kind: 'admin',
                    description: "Si le document n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,3,22),
                    end_time: DateTime.new(2020,3,22))

task3_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'RDV brief',
                    kind: 'admin',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_time: DateTime.new(2020,3,26),
                    end_time: DateTime.new(2020,3,26))

task4_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Évènement',
                    kind: 'évènement',
                    urgent: false,
                    start_time: DateTime.new(2020,4,1),
                    end_time: DateTime.new(2020,4,1))

task5_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Post-traitement',
                    kind: 'créa',
                    description: "Marge de 7 jours pour traiter les photos",
                    urgent: false,
                    start_time: DateTime.new(2020,4,2),
                    end_time: DateTime.new(2020,4,2))

task6_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Livrer photos + envoyer facture',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,4,8),
                    end_time: DateTime.new(2020,4,8))

task7_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    urgent: false,
                    start_time: DateTime.new(2020,5,1),
                    end_time: DateTime.new(2020,5,1))

task8_entreprise_lecamion = Task.create!(
                    prestation: prestation_entreprise_lecamion,
                    name: 'Valider réception solde',
                    kind: 'admin',
                    description: "Si le solde n'a pas été reçu : relancer le client",
                    urgent: false,
                    start_time: DateTime.new(2020,5,16),
                    end_time: DateTime.new(2020,5,16))


puts "Finished creating 3 group of tasks..."

puts "__________________________________________________________"
puts "Finished Seeding!"
