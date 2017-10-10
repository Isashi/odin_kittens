class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
		respond_to do |format|
  		format.html # show.html.erb
  		format.json { render json: @kittens }
 		end
	end

	def show
		@kitten = Kitten.find(params[:id])
				respond_to do |format|
  			format.html # show.html.erb
  			format.json { render json: @kitten }
 		end
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		@kitten.save
		flash[:notice] = "Kitten created!"
		redirect_to @kitten
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])

		flash[:notice] = "Kitten updated!"
		@kitten.update(kitten_params)
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.destroy
		flash[:notice] = "Kitten killed!"
		redirect_to root_path
	end

	def kitten_params
 		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
