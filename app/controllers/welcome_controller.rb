class WelcomeController < ApplicationController
  def index
  end
  
  def focus_to_section
    @section_id = params[:section_id]
  end
end
