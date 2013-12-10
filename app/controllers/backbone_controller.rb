class BackboneController < ApplicationController
  layout "backbone_only",:only=>:index
  def index
  	 @course=Course.first
  end
  def method_name
  	
  end
end
