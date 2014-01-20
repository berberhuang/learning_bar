class BackboneController < ApplicationController
  layout "backbone_only"
  def index
  	 @course=Course.first
  	 if @course ==nil
  	 	@course=Course.new
  	 end
  end
  def about
  end
end
