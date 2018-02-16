# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r=Role.new
r.name="admin"
r.save

r=Role.new
r.name="adminExtension"
r.save

r=Role.new
r.name="adminInvestigacion"

r=Role.new
r.name="docenteInvestigador"
r.save

r=Role.new
r.name="alumnoInvestigador"
r.save


admin = User.new
admin.name = "Admin"
admin.last_name="Kallus"
admin.email = "admin@uni.edu.py"
admin.add_role :admin
admin.password = 123456
admin.save

admin = User.new
admin.name = "Mirta"
admin.last_name ="Arambulo"
admin.email = "mirtaarambulo@gmail.com"
admin.add_role :docenteInvestigador
admin.password = 123456
admin.save

admin = User.new
admin.name = "Enzo"
admin.last_name ="Marecos"
admin.email = "enzomarecos@gmail.com"
admin.add_role :adminExtension
admin.password = "holaquehace"
admin.save

admin = User.new
admin.name = "Roberto"
admin.last_name ="Kumagai"
admin.email = "hisakuma@gmail.com"
admin.add_role :adminInvestigacion
admin.password = "holaquehace"
admin.save


admin = User.new
admin.name = "Simon"
admin.last_name = "Esquivel"
admin.email = "simonlucas1996@gmail.com"
admin.add_role :alumnoInvestigador
admin.password = 123456
admin.save



student = StudentType.new
student.participant = "Beneficiario"
student.save

student = StudentType.new
student.participant = "Extensionista"
student.save

acti = ExtensionType.new
acti.name = "Activity"
acti.save

proy = ExtensionType.new
proy.name = "Proyect"
proy.save

servi = ExtensionType.new
servi.name = "Service"
servi.save

Audit.delete_all