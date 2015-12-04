# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create!( name: "Admin",
              email: "admin@admin.com",
              password:               "password",
              password_confirmation:  "password",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)

User.create!( name: "foobar",
              email: "foo@bar.com",
              password:               "foobar",
              password_confirmation:  "foobar",
              activated: true,
              activated_at: Time.zone.now)

User.create!( name: "foobar",
              email: "foo1@bar.com",
              password:               "foobar",
              password_confirmation:  "foobar")

User.create!( name: "foobar",
              email: "foo2@bar.com",
              password:               "foobar",
              password_confirmation:  "foobar")
