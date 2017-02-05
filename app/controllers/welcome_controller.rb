class WelcomeController < ApplicationController
  def index
    @you_are_home = true
    cookies[:carousel_index] = 0
  end
  
  def scroll_to_top
  end
  
  def focus_to_section
    @section_id = params[:section_id]
    @close_menu = params[:close_menu]
  end
end
