module TranslationsHelper

  def show_locales_tree(keys, prefix)
    return "".html_safe if keys.blank?

    content_tag :ul do
      keys.each do |key, value|
        full_key = "#{prefix}#{key}"

        li_attrs = nil
        if value.kind_of?(String)
          li_attrs = { "data-key" => full_key, "data-value" => value }
        end

        concat(content_tag :li, li_attrs do
          concat content_tag(:span, key, :class => "key")

          case value
          when String
            concat content_tag(:span, value, :class => "value")
          when Hash
            concat show_locales_tree(value, full_key + ".")
          end
        end)
      end
    end

  end

end
