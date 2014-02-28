class BackboneController < ApplicationController
  layout "backbone_only"
  def index
  	@catagory=CourseCatagory.all
  	Rails.logger.info @catagory.inspect
  end
  def about
  end

  def FAQ
  end
end
