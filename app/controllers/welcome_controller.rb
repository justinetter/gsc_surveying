class WelcomeController < ApplicationController
  def index
    @you_are_home = true
  end
  
  def scroll_to_top
  end
  
  def focus_to_section
    @section_id = params[:section_id]
  end
end
