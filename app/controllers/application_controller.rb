class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_user_task


  def current_user    
    User.find_by(id: session[:user_id])  
  end

  def logged_in?     
    !current_user.nil?  
  end

  def current_user_task
    if !logged_in?
      redirect_to root_path
    end

    if current_user.nivel == "Digitador"
    	Digital.pending.length
    elsif current_user.nivel == "Indizador"
    	Indizacion.pending.length
    elsif current_user.nivel == "Validador"
    	Review.pending.length
    else
    	0
    end
  end


end
