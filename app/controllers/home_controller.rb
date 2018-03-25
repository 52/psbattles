class HomeController < ApplicationController
  def index
    @battles = Battle.top
  end
end
