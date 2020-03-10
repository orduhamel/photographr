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

ophelie_image = File.open(Rails.root.join("db/fixtures/ophelie-raymond-duhamel-avatar_niayvv.jpg"))
ophelie = User.new(email: 'opheduhamel@gmail.com', password: 'secret', first_name: 'Ophélie', last_name: 'Raymond-Duhamel')
ophelie.photo.attach(io: ophelie_image, filename: "#{ophelie.first_name.downcase}.jpg", content_type: 'image/jpg')
ophelie.save!

puts "Finished seeding 1 user..."

puts "Seeding 3 clients..."

marie_image = File.open(Rails.root.join("db/fixtures/famille_meenww.jpg"))
marie = Client.new(first_name: "Marie", last_name: "Mingant", address: "9 rue des lilas Nantes", phone_number: "0789042364", email: "mariemingant@gmail.com", tutoiement: true, partner_name: "Nicolas Laurent", notes: "clients rencontrés dans le cadre d'une prestation famille")
marie.photo.attach(io: ophelie_image, filename: "#{marie_image.first_name.downcase}.jpg", content_type: 'image/jpg')
marie.user = ophelie
marie.save!

marine_image = File.open(Rails.root.join("db/fixtures/photo-couple_gpf4zr.jpg"))
marine = Client.new(first_name: "Marine", last_name: "Leon", address: "12 rue commandant Groix Nantes", phone_number: "0743890152", email: "marineleon@gmail.com", tutoiement: false, partner_name: "Martin Dupont", notes: "clients rencontrés dans le cadre de leur mariage")
marine.photo.attach(io: marine_image, filename: "#{marine.first_name.downcase}.jpg", content_type: 'image/jpg')
marine.user = ophelie
marine.save!

annaig_image = File.open(Rails.root.join("db/fixtures/was-logo-page-001_dgjnaz.jpg"))
annaig = Client.new(first_name: "Annaig", last_name: "Billon", company_name: 'We Are Single', address: "10 Place de l'Église Saint-Sébastien-sur-Loire", phone_number: "0643215698", email: "annaigbillon@gmail.com", tutoiement: true, partner_name:, notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
annaig.photo.attach(io: annaig_image, filename: "#{annaig.first_name.downcase}.jpg", content_type: 'image/jpg')
annaig.user = ophelie
annaig.save!

puts "Finished seeding 3 clients..."


puts "Seeding 3 prestations..."

prestation1 = Prestation.create!(client: marie, title: "Famille Mingant", category: "Famille", location: "9 rue des lilas Nantes", notes: "prestation famille. Ils ont deux enfants", status: "Terminé")

prestation2 = Prestation.create!(client: marine, title: "Mariage Leon & Dupont", category: "Mariage", location: "29 Rue de Strasbourg Nantes", notes: "mariage à la mairie de Nantes", status: "En cours")

prestation3 = Prestation.create!(client: annaig, title: "Entreprise We Are Single", category: "Entreprise", location: "24 Rue de la Noé Cottee Saint-Sébastien-sur-Loire", notes: "événement de rencontre pour célibataires.", status: "En cours")

puts "Finished seeding 3 prestations..."


puts "Creating 3 tasks..."

#milestones mariage

task = Task.create!(prestation: prestation1, name: "Envoyer contrat & facture 1er acompte" , kind: "admin", descriptions:, urgent: false, start_time: DateTime.new(2020,4,5) , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation1, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )


















































































































#milestones famille leon

task1_famille_leon = Task.create!(
                    prestation: prestation_famille_leon,
                    name: "Envoyer contrat & facture",
                    kind: 'admin',
                    description:,
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
                    description:,
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
                    name: "Post-traitement des photos",
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
                    name: 'RDV brief',
                    kind: 'admin',
                    description: "Discussion avec le client sur le brief de la prestation",
                    urgent: false,
                    start_time: DateTime.new(2020,3,16),
                    end_time: DateTime.new(2020,3,16))

task4_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Évènement',
                    kind: 'évènement',
                    description:,
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
                    description:,
                    urgent: false,
                    start_time: DateTime.new(2020,3,30),
                    end_time: DateTime.new(2020,3,30))

task7_entreprise_wearesingle = Task.create!(
                    prestation: prestation_entreprise_wearesingle,
                    name: 'Relancer paiement',
                    kind: 'admin',
                    description:,
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


puts "Finished creating 3 tasks..."

puts "__________________________________________________________"
puts "Finished Seeding!"
