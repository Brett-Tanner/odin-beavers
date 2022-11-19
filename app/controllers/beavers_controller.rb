class BeaversController < ApplicationController
  def index
    @beavers = Beaver.all
  end

  def new
    @beaver = Beaver.new
  end

  def create
    @beaver = Beaver.new(beaver_params)

    if @beaver.save
      flash[:notice] = "Beaver successfully created!"
      redirect_to beaver_path(@beaver)
    else
      flash.now[:alert] = "Beaver could not be created("
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @beaver = Beaver.find(params[:id])
  end

  def destroy
    if Beaver.find(params[:id]).destroy
      flash[:notice] = "Successfully destroyed the beaver("
      redirect_to root_path
    else
      flash.now[:alert] = "Silly human, beavers are too powerful to be destroyed by mere mortals"
    end
  end

  def edit
    @beaver = Beaver.find(params[:id])
  end

  def update
    @beaver = Beaver.find(params[:id])

    if @beaver.update(beaver_params)
      flash[:notice] = "Beaver updated successfully!"
      redirect_to beaver_path(@beaver)
    else
      flash.now[:alert] = "Beaver refused to be altered"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def beaver_params
    params.require(:beaver).permit(:name, :age, :cuteness, :hunger, :fav_food, :place_of_residence)
  end
end
