class Digital < ApplicationRecord
	mount_uploader :imglote, AttachmentUploader # Tells rails to use this uploader for this model.   
	validates :nro_lote, presence: true
	validates :documento, presence: true
	validates :nro_pages, presence: true
	validates :imglote, presence: true
	validates :nro_pages, numericality: true
	
	validates :nro_lote, length: { minimum: 5 }
	validates :documento, length: { minimum: 5 }


	def self.pending
		Digital.find_by_sql("select u.nombre || ' ' || u.apellido_paterno [user_name], d.* from digitals d
							left join users u on d.user_id = u.id
							left join indizacions i on d.id = i.doc_id
							where i.id is null")
	end

end
