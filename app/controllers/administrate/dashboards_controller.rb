# frozen_string_literal: true
class Administrate::DashboardsController < ApplicationController
  before_action :authenticate_admin!

  layout "administrate"

  def index; end
end
