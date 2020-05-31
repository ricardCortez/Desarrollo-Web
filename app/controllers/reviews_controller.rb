class ReviewsController < ApplicationController
  def index
  end

  def show
    if !logged_in?
      redirect_to root_path
    end

    @reviews = Review.pending
  end

  def edit
    if !logged_in?
      redirect_to root_path
    end

    @review = Review.find_by(doc_id: params[:id])
    @indizacion = Indizacion.find_by(doc_id: params[:id])
    @digital = Digital.find(params[:id])
    @tipres = Resolucion.all
  end

  def update
    if !logged_in?
      redirect_to root_path
    end

    @val = Review.find_by(doc_id: params[:id])
    if @val
      @review = Review.find(@val.id)
      if @review.update(review_params)
        redirect_to '/reviews/show'
      else
        redirect_to :action => :edit, :id => @val.doc_id
      end
    else
      @review = Review.create(review_params)
      if @review.save
        redirect_to '/reviews/show'
      else
        redirect_to :action => :edit, :id => @val.doc_id
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:resolucion, :observacion, :doc_id, :user_id)
  end
end
