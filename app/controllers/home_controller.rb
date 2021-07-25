class HomeController < ApplicationController
  def index
    # if user_signed_in?
    #   redirect_to 
    # end
    @user_infos = current_user.infos if current_user.present?
  end
end
