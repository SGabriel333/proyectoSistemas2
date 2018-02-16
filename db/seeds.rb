# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new
admin.name = "Admin"
admin.email = "admin@uni.edu.py"
admin.password = 123456
admin.save

admin = User.new
admin.name = "Simon"
admin.email = "simonlucas1996@gmail.com"
admin.password = 123456
admin.save

acti = ExtensionType.new
acti.name = "Activity"
acti.save

proy = ExtensionType.new
proy.name = "Proyect"
proy.save

servi = ExtensionType.new
servi.name = "Service"
servi.save