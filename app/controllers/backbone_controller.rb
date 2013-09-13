class BackboneController < ApplicationController
  def index
  end
  def course_info
     @course=Course.find(params[:id])
  end
end
