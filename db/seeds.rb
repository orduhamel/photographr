require "open-uri"

puts "Deleting all Users..."
Users.destroy_all
puts "Done deleting all Users"
puts "Deleting all Clients..."
Clients.destroy_all
puts "Done deleting all Clients"
puts "Deleting all prestations..."
Prestations.destroy_all
puts "Done deleting all Prestations"

puts "Implementing the Seeds..."

# owners
puts "Seeding 1 User..."

ophelie_image = melanie_image = URI.open("https://res.cloudinary.com/dvki8mxm4/image/upload/v1583773764/Photographer/ophelie-raymond-duhamel-avatar_niayvv.jpg")
ophelie = User.new(email: 'opheduhamel@gmail.com', password: 'secret', first_name: 'Ophélie', last_name: 'Raymond-Duhamel')
ophelie.photo.attach(io: ophelie_image, filename: "#{ophelie.first_name.downcase}.jpg", content_type: 'image/jpg')
melanie.save!

puts "Finished seeding 1 user..."

puts "Seeding 3 clients..."

marie_image = URI.open("https://res.cloudinary.com/dvki8mxm4/image/upload/v1583773765/Photographer/famille_meenww.jpg")
marie = Client.new(first_name: "Marie", last_name: "Mingant", address: "9 rue des lilas Nantes", phone_number: "0789042364", email: "mariemingant@gmail.com", tutoiement: true, partner_name: "Nicolas Laurent", notes: "clients rencontrés dans le cadre d'une prestation famille")
marie.photo.attach(io: simon_image, filename: "#{simon.first_name.downcase}.jpg", content_type: 'image/jpg')
marie.user = ophelie
marie.save!

marine_image = URI.open("https://res.cloudinary.com/dvki8mxm4/image/upload/v1583773765/Photographer/photo-couple_gpf4zr.jpg")
marine = Client.new(first_name: "Marine", last_name: "Leon", address: "12 rue commandant Groix Nantes", phone_number: "0743890152", email: "marineleon@gmail.com", tutoiement: false, partner_name: "Martin Dupont", notes: "clients rencontrés dans le cadre de leur mariage")
marine.photo.attach(io: marine_image, filename: "#{marine.first_name.downcase}.jpg", content_type: 'image/jpg')
marine.user = ophelie
marine.save!

annaig_image = URI.open("https://res.cloudinary.com/dvki8mxm4/image/upload/v1583773765/Photographer/was-logo-page-001_dgjnaz.jpg")
annaig = Client.new(first_name: "Annaig", last_name: "Billon", address: "10 Place de l'Église Saint-Sébastien-sur-Loire", phone_number: "0643215698", email: "annaigbillon@gmail.com", tutoiement: true, partner_name:, notes: "La cliente m'a fait appel pour photographier l'événement de son entreprise We Are Single")
annaig.photo.attach(io: annaig_image, filename: "#{annaig.first_name.downcase}.jpg", content_type: 'image/jpg')
annaig.user = ophelie
annaig.save!

puts "Finished seeding 3 clients..."


puts "Seeding 3 prestations..."

prestation1 = Prestation.new(title: "Famille Mingant", category: "Famille", location: "9 rue des lilas Nantes", notes: "prestation famille. Ils ont deux enfants", status: "En cours")
prestation1.client = marie
prestation1.save!

prestation2 = Prestation.new(title: "Mariage Leon Dupont", category: "Mariage", location: "29 Rue de Strasbourg Nantes", notes: "mariage à la mairie de Nantes", status: "Terminé")
prestation2.client = marine
prestation2.save!

prestation3 = Prestation.new(title: "Entreprise We Are Single", category: "Entreprise", location: "24 Rue de la Noé Cottee Saint-Sébastien-sur-Loire", notes: "événement de rencontre pour célibataires.", status: "En cours")
prestation3.client = annaig
prestation3.save!


puts "Finished seeding 3 prestations..."


puts "Creating 3 tasks..."



puts "Finished creating 3 tasks..."

puts "__________________________________________________________"
puts "Finished Seeding!"
