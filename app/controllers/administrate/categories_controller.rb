# frozen_string_literal: true
class Administrate::CategoriesController < AdministrateController
  def index
    @categories = Category.all
  end
end
