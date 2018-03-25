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

users = []
51.times do |i|
  user = User.create! username: "user_#{i}", email: "user_#{i}@local.com",
                      password: "123", password_confirmation: "123"
  users << user
end

coat = admin.battles.create! title: "Cute Kid in Umbrella Coat",
                             link:  "https://i.imgur.com/mZyj7Oc.jpg"

coat1 = coat.submissions.create! title:   "Balloon kid",
                                 link:    "https://i.imgur.com/rXrDzsf.jpg",
                                 user_id: john.id

coat2 = coat.submissions.create! title:   "Only way I saw it",
                                 link:    "https://i.imgur.com/iL2jb0R.png",
                                 user_id: jack.id

coat3 = coat.submissions.create! title:   "hmmm",
                                 link:    "https://i.imgur.com/9ZWAPYu.jpg",
                                 user_id: jane.id

coat4 = coat.submissions.create! title:   "A call to action",
                                 link:    "https://i.imgur.com/46EdSBr.png",
                                 user_id: jane.id

coat5 = coat.submissions.create! link:    "https://i.imgur.com/AveTbum.jpg",
                                 user_id: jill.id

(0..50).each do |i|
  coat.liked_by users[i]
  coat4.liked_by users[i]
end

(0..40).each do |i|
  coat5.liked_by users[i]
end

(0..30).each do |i|
  coat1.liked_by users[i]
end

(0..20).each do |i|
  coat3.liked_by users[i]
end

(0..10).each do |i|
  coat2.liked_by users[i]
end

(1..5).each do |i|
  users[i].battles.create! title: "Battle by user #{i}",
                           link:  "https://i.imgur.com/XJKjKAK.png"
end
