# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @pagy, @categories = pagy(Category.all, items: 8)
  end
end
