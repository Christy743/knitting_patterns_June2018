module ApplicationHelper

  def resolve_boolean_parameter resource, attribute, options = {}
    default = options.delete(:default)
    return default unless params[:utf8]

    return params[resource][attribute] == "1"
  end

  def render_stars(rating)
    StarsRenderer.new(rating, self).render_stars
  end

end
