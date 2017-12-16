class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  @category = Category.find(params[:id])
  
end
