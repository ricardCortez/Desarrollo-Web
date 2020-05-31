class IndizacionsController < ApplicationController
  def index
  end

  def show
    if !logged_in?
      redirect_to root_path
    end

    @indizacions = Indizacion.pending
  end

  def edit
    if !logged_in?
      redirect_to root_path
    end

    @indizacion = Indizacion.find_by(doc_id: params[:id])
    @digital = Digital.find(params[:id])
    @tipdocs = Tipodocumento.all
  end

  def update
    if !logged_in?
      redirect_to root_path
    end

    @val = Indizacion.find_by(doc_id: params[:id])
    if @val
      @indizacion = Indizacion.find(@val.id)
      if @indizacion.update(indizacion_params)
        redirect_to '/indizacions/show'
      else
        redirect_to :action => :edit, :id => @val.doc_id
      end
    else
      @indizacion = Indizacion.create(indizacion_params)
      if @indizacion.save
        redirect_to '/indizacions/show'
      else
        redirect_to :action => :edit, :id => @val.doc_id
      end
    end
  end

  def delete
    if !logged_in?
      redirect_to root_path
    end

    @indizacion = Indizacion.find(params[:id])
  end

  def destroy
    if !logged_in?
      redirect_to root_path
    end

    @indizacion = Indizacion.find(params[:id])
    @indizacion.destroy
    redirect_to '/indizacions/show'
  end

  private
  # Only allow a list of trusted parameters through.
  def indizacion_params
    params.require(:indizacion).permit(:tipo_doc, :num_doc, :fecha_doc, :ini_fol, :fin_fol, :ini_doc, :fin_doc, :doc_id, :user_id)
  end
end
