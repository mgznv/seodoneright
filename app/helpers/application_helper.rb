module ApplicationHelper
  def meta_og_tags(properties = {})
    return unless properties.is_a? Hash

    tags = []

    properties.each do |property, value|
      tags << tag(:meta, property: "og:#{property}", content: value)
    end

    tags.join.html_safe  # Remember in Ruby the last line is returned
  end
end