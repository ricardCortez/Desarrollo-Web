class ReportsController < ApplicationController
  def index
  end

  def show
	 if !logged_in?
      redirect_to root_path
    end

    @digitals = Digital.find_by_sql("select
										d.*,
										case when d.id is not null then true end [step1],
										case when i.id is not null then true end [step2],
										case when r.id is not null then true end [step3]
									from digitals d
									left join users u on d.user_id = u.id
									left join indizacions i on d.id = i.doc_id
									left join reviews r on d.id = r.doc_id")
  end


  def view
    if !logged_in?
      redirect_to root_path
    end

    @digital = Digital.find_by_sql("select d.*, u.nombre || ' ' || u.apellido_paterno || ' ' || u.apellido_materno [user_name]
                                    from digitals d
                                    left join users u on d.user_id = u.id
                                    where d.id=" + params[:id])

    @indizacion = Indizacion.find_by_sql("select i.*, u.nombre || ' ' || u.apellido_paterno || ' ' || u.apellido_materno [user_name]
                                    from indizacions i
                                    left join users u on i.user_id = u.id
                                    where i.doc_id=" + params[:id])

    @review = Review.find_by_sql("select r.*, u.nombre || ' ' || u.apellido_paterno || ' ' || u.apellido_materno [user_name]
                                    from reviews r
                                    left join users u on r.user_id = u.id
                                    where r.doc_id=" + params[:id])

  end

  def indicator
    if !logged_in?
      redirect_to root_path
    end

    @digital = Digital.all
    @indizacion = Indizacion.all
    @review = Review.all
    @accept = Review.find_by_sql("select r.* from reviews r where r.resolucion = 'Aceptado'")
    @rejected = Review.find_by_sql("select r.* from reviews r where r.resolucion = 'Denegado'")
    @indizacion_pending = Indizacion.find_by_sql("select * from digitals d  left join indizacions i on d.id = i.doc_id where i.id is null").length
    @review_pending = Review.pending.length
  end

end
