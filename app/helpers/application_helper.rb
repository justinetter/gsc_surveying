module ApplicationHelper
  def fa_icon icon, label='', size=''
    str = %Q[<i class="fa fa-#{icon}#{' ' + size if size.present?}"></i>] + " " + label
    return str.html_safe
  end
end
