# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def active_link?(controller_action)
    return "active" if params[:controller] == controller_action
  end
end
