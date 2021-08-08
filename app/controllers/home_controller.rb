class HomeController < ApplicationController
  def index
      @users = User.all.where(role: "user")
  end

  def jogging_times

  end

  
end
