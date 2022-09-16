class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new; end

  def create
    @food = current_user.foods.new(food_params)
# condition to check if food created
    if @food.save
      redirect_to foods_path, notice: 'Food created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
