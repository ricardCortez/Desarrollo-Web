class Indizacion < ApplicationRecord
	validates :tipo_doc, presence: true
	validates :num_doc, presence: true

	def self.pending
		Indizacion.find_by_sql("select
									d.id [d_id], d.nro_lote [d_nro_lote], d.documento [d_documento], d.nro_pages [d_nro_pages], d.imglote [d_imglote],
									i.id [i_id], i.tipo_doc [i_tipo_doc], i.num_doc [i_num_doc], i.fecha_doc [i_fecha_doc],
									u.nombre || ' ' || u.apellido_paterno [d_user_name]
								from digitals d
								left join users u on d.user_id = u.id
								left join indizacions i on d.id = i.doc_id
								left join reviews r on d.id = r.doc_id
								where r.id is null")
	end

end
