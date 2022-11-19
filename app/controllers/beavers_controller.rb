class BeaversController < ApplicationController
  def index
    @beavers = Beaver.all
    
    respond_to do |format|
      format.html
      format.json {render :json => @beavers}
    end
  end

  def new
    @beaver = Beaver.new(url: get_beaver_url)
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

    respond_to do |format|
      format.html
      format.json {render :json => @beaver}
    end
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
    params.require(:beaver).permit(:name, :age, :cuteness, :hunger, :fav_food, :place_of_residence, :url)
  end

  def get_beaver_url
    sort_options = ["date-posted-asc", "date-posted-desc", "date-taken-asc", "date-taken-desc", "interestingness-desc", "interestingness-asc", "relevance"]

    beavers = Hash.from_xml(RestClient.get("https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_KEY']}&tags=beaver,animal&tag_mode=all&sort=#{sort_options[rand(0..6)]}&safe_search=1&content_type=1&per_page=10&page=1"))

    selected_beaver = beavers["rsp"]["photos"]["photo"][rand(0..10)]

    return "https://live.staticflickr.com/#{selected_beaver["server"]}/#{selected_beaver["id"]}_#{selected_beaver["secret"]}.jpg"
  end
end
