class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
		@city = City.new
	end

  def create
    @city = City.new(entry_params)
    if @city.save
      flash[:notice] = "Entry city successfully"
      redirect_to action: 'index', controller: 'cities'
    else
      flash[:alert] = "Sorry, something went wrong"
      render "new"
    end
  end

  def show
    @city = City.find_by(id: params[:id]) || render_404_(params)
  end

  def edit
    @city = City.find params[:id]
  end

  def update
		#Find the project
		@city = City.find params[:id]
		#update the entry using update_attributes
		if @city.update_attributes(entry_params)
			#If ok redirect_to entries index
			redirect_to action: 'index', controller: 'cities', id: @city.id
		#If wrong show the form again
		else
			render "edit"
		end
  end

  def destroy
    @city = City.find_by(id: params[:id])
    @city.destroy
    redirect_to action:'index', controller: 'cities'
  end

private
	def entry_params
		params.require(:city).permit(:name, :description, :latitude, :longitude)
	end

end
