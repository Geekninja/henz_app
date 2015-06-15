module ApplicationHelper

  def status_helper(status) 
    if status
      "<span class= 'label label-success'>ativo</span>".html_safe
    else
      "<span class= 'label label-default'>inativo</span>".html_safe
    end
  end

  def bill_type(type)
    case type
    when 'pagamento'
      "<span class= 'label label-danger'>pagamento</span>".html_safe
    when 'recebimento'
      "<span class= 'label label-success'>recebimento</span>".html_safe
    when 'faturamento'
      "<span class= 'label label-info'>faturamento</span>".html_safe
    end
  end
end
