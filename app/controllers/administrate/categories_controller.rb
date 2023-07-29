# frozen_string_literal: true
class Administrate::CategoriesController < AdministrateController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to(administrate_post_url(@category), notice: "Uma categoria foi criada com sucesso!") }
        format.json { render(:show, status: :created, location: @category) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @category.errors, status: :unprocessable_entity) }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
