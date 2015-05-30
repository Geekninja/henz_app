module ApplicationHelper

  def status_helper(status) 
    if status
      "<span class= 'label label-success'>ativo</span>".html_safe
    else
      "<span class= 'label label-default'>inativo</span>".html_safe
    end
  end
end
