class HomeController < ApplicationController
  before_action :authorize
  before_action :admin?, except: [:index, :show, :principal]  
  def principal
  end
end
