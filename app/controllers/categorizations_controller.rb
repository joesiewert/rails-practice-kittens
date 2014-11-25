class CategorizationsController < ApplicationController

  before_action do
    @kitten = Kitten.find(params[:kitten_id])
  end

  def new
    @categorization = @kitten.categorizations.new
  end

  def create
    @categorization = @kitten.categorizations.new(cat_params)
    if @categorization.save
      redirect_to root_path, notice: "Kitten #{@kitten.id}: Categorized."
    else
      render :new
    end
  end

  private

    def cat_params
      params.require(:categorization).permit(:category_id)
    end

end
