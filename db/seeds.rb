admin = User.create! username: "admin", email: "admin@local.com",
                     password: "123", password_confirmation: "123"

john = User.create! username: "John", email: "john@local.com",
                    password: "123", password_confirmation: "123"

jack = User.create! username: "Jack", email: "jack@local.com",
                    password: "123", password_confirmation: "123"

jane = User.create! username: "Jane", email: "jane@local.com",
                    password: "123", password_confirmation: "123"

jill = User.create! username: "Jill", email: "jill@local.com",
                    password: "123", password_confirmation: "123"

monk = admin.battles.create! title: "A muscle-ridden Monk sweeping a sidewalk.",
                             link:  "https://i.imgur.com/Qyp26ka.jpg"

leo  = admin.battles.create! title: "Leonardo DiCaprio chatting with young fan",
                             link:  "https://i.imgur.com/Ie2g8Ok.jpg"

coat = admin.battles.create! title:  "Cute Kid in Umbrella Coat",
                             link:   "https://i.imgur.com/mZyj7Oc.jpg",
                             points: 5234

coat.submissions.create! title:   "Balloon kid",
                         link:    "https://i.imgur.com/rXrDzsf.jpg",
                         user_id: john.id,
                         points:  3898

coat.submissions.create! title:   "Only way I saw it",
                         link:    "https://i.imgur.com/iL2jb0R.png",
                         user_id: jack.id,
                         points:  1745

coat.submissions.create! title:   "hmmm",
                         link:    "https://i.imgur.com/9ZWAPYu.jpg",
                         user_id: jack.id,
                         points:  1324

coat.submissions.create! title:   "A call to action",
                         link:    "https://i.imgur.com/46EdSBr.png",
                         user_id: jane.id,
                         points:  959

coat.submissions.create! link:    "https://i.imgur.com/AveTbum.jpg",
                         user_id: jill.id,
                         points:  1279
