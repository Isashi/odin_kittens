class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		@kitten.save
		redirect_to @kitten
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])

		@kitten.update(kitten_params)
		redirect_to @kitten
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.destroy
		redirect_to root_path
	end

	def kitten_params
 		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
