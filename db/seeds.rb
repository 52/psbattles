admin = User.create! username: "admin", email: "admin@local.com",
                     password: "123", password_confirmation: "123"

admin.battles.create! title: "A muscle-ridden Monk sweeping a sidewalk.",
                      link:  "https://i.imgur.com/Qyp26ka.jpg"

admin.battles.create! title: "Leonardo DiCaprio chatting with young fan",
                      link:  "https://i.imgur.com/Ie2g8Ok.jpg"

admin.battles.create! title: "Cute Kid in Umbrella Coat",
                      link:  "https://i.imgur.com/mZyj7Oc.jpg"
