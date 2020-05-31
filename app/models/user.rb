class User < ApplicationRecord
	mount_uploader :imglote, AttachmentUploader # Tells rails to use this uploader for this model.   
	validates :correo, presence: true
	validates :nivel, presence: true
	validates :nombre, length: { minimum: 2 }
	validates :apellido_paterno, length: { minimum: 2 }
	validates :apellido_materno, length: { minimum: 2 }
end
