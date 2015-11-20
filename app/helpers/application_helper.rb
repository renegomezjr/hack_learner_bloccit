module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: "form-grou has-error"
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
