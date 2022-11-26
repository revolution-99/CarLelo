module ApplicationHelper

    private
    def model_params(model_name)
      params.require(model_name).permit(:name)
    end

    def sortable(title, column, direction, filter_status)
      direction = (sort_column && sort_direction == "asc") ? "desc" : "asc"
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      # link_to title, {sort: column, direction: direction, class: css_class }
      link_to "#{title} <i class='#{direction == "desc" ? "bi bi-caret-down" : "bi bi-caret-up"}'></i>".html_safe, {sort: column, direction: direction, status: filter_status}, {class: css_class}
    end
end
