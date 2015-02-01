module BootstrapHelper
  
  def has_error(object, method)
    if object.errors.any? && object.errors.include?(method)
      "has-error"
    end
  end
  
  def bootstrap_errors(f)
    return "" if f.object.errors.empty?

    content_tag(:div, class: "form-group") do
      content_tag(:div, class: "col-sm-offset-2 col-sm-10") do
        content_tag(:div, class: "panel panel-default panel-danger") do
          content_tag(:div, class: "panel-heading") do
            content_tag(:h2, class: "panel-title") do
              I18n.t("errors.messages.not_saved", :count => f.object.errors.count, :resource => f.object.class.model_name.human.downcase)
            end
          end +
          content_tag(:div, class: "panel-body") do
            content_tag(:ul) do
              f.object.errors.full_messages.map do |msg|
                content_tag(:li, msg)
              end.join.html_safe
            end
          end
        end
      end
    end
  end
  
  def bootstrap_errors_no_offset(f)
    return "" if f.object.errors.empty?

    content_tag(:div, class: "form-group") do
      content_tag(:div, class: "col-sm-12") do
        content_tag(:div, class: "panel panel-default panel-danger") do
          content_tag(:div, class: "panel-heading") do
            content_tag(:h2, class: "panel-title") do
              I18n.t("errors.messages.not_saved", :count => f.object.errors.count, :resource => f.object.class.model_name.human.downcase)
            end
          end +
          content_tag(:div, class: "panel-body") do
            content_tag(:ul) do
              f.object.errors.full_messages.map do |msg|
                content_tag(:li, msg)
              end.join.html_safe
            end
          end
        end
      end
    end
  end
  
  def validation_state?(success, danger = false)
    return "error" if danger
    if success
      "success"
    else
      "warning"
    end
  end
  
  def panel_validation_state?(success, danger = false)
    return "danger" if danger
    if success == true
      "success"
    else
      "warning"
    end
  end
  
  def default_or_danger?(boolean_value)
    if boolean_value
      "default"
    else
      "danger"
    end
  end
  
  def success_or_warning?(boolean_value)
    if boolean_value
      "success"
    else
      "warning"
    end
  end
  
  def success_or_danger?(boolean_value)
    if boolean_value
      "success"
    else
      "danger"
    end
  end
  
  def success?(boolean_value)
    "success" if boolean_value
  end
end