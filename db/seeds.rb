# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(correo: "admin@ositran",
			clave: Digest::MD5.hexdigest("admin"),
			nombre: "admin",
			apellido_paterno: "admin",
			apellido_materno: "admin",
			empresa_id: "Ositran" ,
			estado: "Activo",
			foto_dir: nil)

Pemiso.create(descripcion: "Administrador")
Pemiso.create(descripcion: "Digitador")
Pemiso.create(descripcion: "Indizador")
Pemiso.create(descripcion: "Validador")

Tipodocumento.create(descripcion: "Mesa de Partes")
Tipodocumento.create(descripcion: "Acta de Consejo Directivo")

Resolucion.create(descripcion: "Aceptado")
Resolucion.create(descripcion: "Denegado")
