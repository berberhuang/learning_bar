class BackboneController < ApplicationController
  layout "backbone_only",:only=>:index
  def index
  	 @course=Course.first
  	 if @course ==nil
  	 	@course=Course.new
  	 end
  end
end
