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
    when 'orçamento'
      "<span class= 'label label-info'>orçamento</span>".html_safe
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    link_to(name, "#", class: "add_fields btn btn-xs btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end

  
end
