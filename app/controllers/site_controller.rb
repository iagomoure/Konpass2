class SiteController < ApplicationController
  before_action :authenticate_user!, only: :panelcontrol

  def home
  end

  def contact
  end

  def panelcontrol
  end
end
