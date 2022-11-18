class BeaversController < ApplicationController
  def index
    @beavers = Beaver.all
  end
end
