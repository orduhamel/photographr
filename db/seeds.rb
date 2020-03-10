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
melanie.save!

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
annaig = Client.new(first_name: "Annaig", last_name: "Billon", address: "10 Place de l'Église Saint-Sébastien-sur-Loire", phone_number: "0643215698", email: "annaigbillon@gmail.com", tutoiement: true, partner_name:, notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
annaig.photo.attach(io: annaig_image, filename: "#{annaig.first_name.downcase}.jpg", content_type: 'image/jpg')
annaig.user = ophelie
annaig.save!

puts "Finished seeding 3 clients..."


puts "Seeding 3 prestations..."

prestation1 = Prestation.create!(client: marie, title: "Famille Mingant", category: "Famille", location: "9 rue des lilas Nantes", notes: "prestation famille. Ils ont deux enfants", status: "Terminé")

prestation2 = Prestation.create!(client: marine, title: "Mariage Leon Dupont", category: "Mariage", location: "29 Rue de Strasbourg Nantes", notes: "mariage à la mairie de Nantes", status: "En cours")

prestation3 = Prestation.create!(title: "Entreprise We Are Single", category: "Entreprise", location: "24 Rue de la Noé Cottee Saint-Sébastien-sur-Loire", notes: "événement de rencontre pour célibataires.", status: "En cours")

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

#milestones famille

task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation2, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )

#milestones entreprise

task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )
task = Task.create!(prestation: prestation3, name: , kind: , descriptions:, urgent: false, start_time: , end_time: )


puts "Finished creating 3 tasks..."

puts "__________________________________________________________"
puts "Finished Seeding!"
