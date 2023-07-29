# frozen_string_literal: true
class Administrate::CategoriesController < AdministrateController
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {
          redirect_to(administrate_category_url(@category), notice: "Uma categoria foi criada com sucesso!")
        }

        format.json { render(:show, status: :created, location: @category) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @category.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html {
          redirect_to(administrate_category_url(@category), notice: "Uma categoria foi atualizada com sucesso!")
       }
        format.json { render(:show, status: :ok, location: @category) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @category.errors, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html do
        if @category.posts.count > 0
          redirect_to(administrate_categories_path, alert: "Não foi possível apagar a categoria!")
        else
          @category.destroy
          redirect_to(administrate_categories_path, notice: "Uma categoria foi apagada com sucesso!")
        end
      end
      format.json { head(:no_content) }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
