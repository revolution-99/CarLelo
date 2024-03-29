# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create_or_find_by!(
    first_name: 'Admin',
    last_name: 'User',
    email: 'admin@carlelo.com',
    password_digest: BCrypt::Password.create('superadmin'),
    is_admin: true,
    email_confirmed: true,
    confirm_token: nil,
    mobile_no: 1234567890
)
User.create_or_find_by!(
    first_name: 'Buyer',
    last_name: 'User',
    email: 'buyer@carlelo.com',
    password_digest: BCrypt::Password.create('superbuyer'),
    is_buyer: true,
    is_seller: false,
    email_confirmed: true,
    confirm_token: nil,
    mobile_no: 9114678902
)
User.create_or_find_by!(
    first_name: 'Seller',
    last_name: 'User',
    email: 'seller@carlelo.com',
    password_digest: BCrypt::Password.create('superseller'),
    is_seller: true,
    is_buyer: false,
    email_confirmed: true,
    confirm_token: nil,
    mobile_no: 9114890123
)
