# frozen_string_literal: true

class AdministrateController < ApplicationController
  before_action :authenticate_admin!

  layout "administrate"
end
