class PagesController < ApplicationController
  def home
    @campaigns = current_user.campaigns if current_user
  end
end
