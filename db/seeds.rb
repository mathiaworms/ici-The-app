u = User.create(alias: "joules", birthday: "04/12/1995", email: "joules@yopmail.com", password: "topsecret", age_range: 10)
=begin u1 = User.create(alias: "roulix", birthday: "10/05/1998", email: "roulix@yopmail.com", password: "topsecret", age_range: 100)
u2 = User.create(alias: "JE", birthday: "04/12/1995", email: "je@yopmail.com", password: "topsecret", age_range: 100, is_admin?: true)
u3 = User.create(alias: "JeremDall", birthday: "14/02/1999", email: "jeremzo@yopmail.com", password: "topsecret", age_range: 100)
u4 = User.create(alias: "WeshMaggle", birthday: "20/05/1984", email: "bobbypill@yopmail.com", password: "topsecret", age_range: 10)
u5 = User.create(alias: "ChaudeLapine", birthday: "22/05/1987", email: "clpne@yopmail.com", password: "topsecret", age_range: 100)
u6 = User.create(alias: "Mathiaworms", birthday: "09/04/1978", email: "mathiawormsdufutur@yopmail.com", password: "topsecret", age_range: 100)
u7 = User.create(alias: "AliHR", birthday: "01/09/1975", email: "kebabfan1995@yopmail.com", password: "topsecret", age_range: 10)
u8 = User.create(alias: "Loubzon", birthday: "28/06/2000", email: "zouzouzouzou@yopmail.com", password: "topsecret", age_range: 100)
u9 = User.create(alias: "Jeremstar", birthday: "16/02/1998", email: "jeremou@yopmail.com", password: "topsecret", age_range: 100)
u10 = User.create(alias: "PascalineDu69", birthday: "17/11/1996", email: "wiwi@yopmail.com", password: "topsecret", age_range: 100)
u11 = User.create(alias: "CrisMenace", birthday: "02/09/1986", email: "flopwzo@yopmail.com", password: "topsecret", age_range: 10)
u12 = User.create(alias: "Lap0ng", birthday: "27/05/1988", email: "caspic@yopmail.com", password: "topsecret", age_range: 100)

Event.destroy_all

current_time = DateTime.now
event1 = Event.create!(title: "🙌Apéro cidre doux🍾🍀", description: "⚜️Je viens de poser mon menhir🗿🗿 sur le coté de la route 🍀et je suis opé pour une petite bolée en détente⚜️", host_id: User.all.sample.id, latitude_pos: 48.871815, longitude_pos: 2.352169, attendees_max: rand(3..10),end_time: current_time + 90.minutes)
event2 = Event.create!(title: "🥁Molkky narguilé🥁", description: "🧞‍♀️Petit molkky à l'orientale, ramenez vos gateaux et vos gazouz on va se mettre bien en lançant des quilles🧞‍♀️", host_id: User.all.sample.id, latitude_pos: 48.871399, longitude_pos: 2.353521, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event3 = Event.create!(title: "Tequila Sunrise🚓", description: "🌅Aventurier solitaire🌅, j'ai garé K2000 et je suis de passage dans le coin. 🛸Quelles sont les aventures à faire par ici?🛸", host_id: User.all.sample.id, latitude_pos: 48.870157, longitude_pos: 2.356278, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event4 = Event.create!(title: "Karaoké Kebab🎤", description: "Du monde pour faire un karaoké/kebab?🎤🎤 Je connais tous les tubes Turques du moment, mais si vous êtes up pour les chansons jap 🎎 c'est bien aussi!", host_id: User.all.sample.id, latitude_pos: 48.867856, longitude_pos: 2.355570, attendees_max: rand(3..10),end_time: current_time + 90.minutes)
event5 = Event.create!(title: "🥏Ultimate Frisbee🥏", description: "Travailleurs, travailleuses, on vous exploite, on vous spolie ! Alors venez au moins faire un ptit frisbee dans le parc!", host_id: User.all.sample.id, latitude_pos: 48.868068, longitude_pos: 2.348023, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event6 = Event.create!(title: "🍆🍆 Comparer l'engin🏆", description: "Qui c'est qui a le plus puissant? 🧐 Venez on va départager la taille de 💪💀 nos engins de mort 💀💪", host_id: User.all.sample.id, latitude_pos: 48.868724, longitude_pos: 2.355731, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event7 = Event.create!(title: "Concert de pipeau🎼", description: "🎺Le pipeau est essentiel à une existence harmonieuse, venez en abreuver vos oreilles🎼🎼.", host_id: User.all.sample.id, latitude_pos: 49.181061, longitude_pos: 2.354951, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event8 = Event.create!(title: "🐓Faire la poule🐓", description: "Envie de pondre un oeuf?🐣 Venez pousser avec moi ! 🍳Peut-être une omelette à la clé🍳 !", host_id: User.all.sample.id, latitude_pos: 48.868773, longitude_pos: 2.353342, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event9 = Event.create!(title: "Monter un 🥽meuble🥽", description: "🥽🥽Le meuble doit être monté, si vous m'aidez à monter le meuble,🥽🥽 je vous offre l'alcool.", host_id: User.all.sample.id, latitude_pos: 48.868267, longitude_pos: 2.351912, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event10 = Event.create!(title: "🧘‍♀️XTreme Reiki🧘‍♂️", description: "🧨🧨On va faire du Reiki de compet les potes, on va se déboucher les chakras au karcher.🧨🧨", host_id: User.all.sample.id, latitude_pos: 48.867990, longitude_pos: 2.353540, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event11 = Event.create!(title: "🍺🍺🍺Une chopine🍺🍺🍺", description: "Je suis d'humeur à boire une chopine à la taverne, 🍺TAVERNIER, AMENE NOUS TON MEILLEUR TONNEAU🍺", host_id: User.all.sample.id, latitude_pos: 48.868472, longitude_pos: 2.355101, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)
event12 = Event.create!(title: "🍸Soirée cocktails🍹", description: "Je sors tester le nouveau bar à cocktails, Maubeuge Sunrise🍹 et Kaki Russian🍸, glouglou", host_id: User.all.sample.id, latitude_pos: 48.870889, longitude_pos: 2.353264, attendees_max: rand(3..10) ,end_time: current_time + 90.minutes)

puts "DB entries created!"
=end
