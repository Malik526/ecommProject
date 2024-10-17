# app/helpers/application_helper.rb
module ApplicationHelper
    def icon(style, name, options = {})
      # Add the Font Awesome classes (fa- for style, and fa-[name])
      icon_class = "#{style} fa-#{name}"
      
      # Merge additional classes (if any) passed in options
      options[:class] = [options[:class], icon_class].compact.join(' ')
      
      # Create the icon tag with the options and classes
      content_tag(:i, '', options)
    end
  end
  