# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u1 = User.create_with(password: "password", password_confirmation: "password")
  .find_or_create_by!(email_address: "greg.silcox+dev1@gmail.com")
u2 = User.create_with(password: "password", password_confirmation: "password")
  .find_or_create_by!(email_address: "greg.silcox+dev2@gmail.com")
u3 = User.create_with(password: "password", password_confirmation: "password")
  .find_or_create_by!(email_address: "greg.silcox+dev3@gmail.com")

g1 = Group.create_with(description: "Group 1 description").
  find_or_create_by!(name: "Group 1")
g2 = Group.create_with(description: "Group 2 description").
  find_or_create_by!(name: "Group 2")
g3 = Group.create_with(description: "Group 3 description").
  find_or_create_by!(name: "Group 3")

p1 = Phone.find_or_create_by!(number: "1234567890")
p2 = Phone.find_or_create_by!(number: "2345678901")
p3 = Phone.find_or_create_by!(number: "3456789012")
p4 = Phone.find_or_create_by!(number: "4567890123")
p5 = Phone.find_or_create_by!(number: "5678901234")
p6 = Phone.find_or_create_by!(number: "6789012345")

r1 = Role.create_with(kind: "admin", status: "active")
  .find_or_create_by!(user_id: u1.id, group_id: g1.id)
r4 = Role.create_with(kind: "member", status: "active")
  .find_or_create_by!(user_id: u1.id, group_id: g2.id)
r5 = Role.create_with(kind: "member", status: "inactive")
  .find_or_create_by!(user_id: u1.id, group_id: g3.id)

r2 = Role.create_with(kind: "member", status: "active")
  .find_or_create_by!(user_id: u2.id, group_id: g2.id)
r3 = Role.create_with(kind: "member", status: "inactive")
  .find_or_create_by!(user_id: u2.id, group_id: g3.id)

l1 = Link.find_or_create_by!(from: u1, to: p1)
l2 = Link.find_or_create_by!(from: u1, to: p2)
l3 = Link.find_or_create_by!(from: u2, to: p3)
l4 = Link.find_or_create_by!(from: u2, to: p4)
l5 = Link.find_or_create_by!(from: u3, to: p5)
l6 = Link.find_or_create_by!(from: u3, to: p6)
