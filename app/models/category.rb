class Category < ActiveRecord::Base
  def slug=(value)
    if value =~ /^\//
      write_attribute :slug, value
    else
      write_attribute :slug, "/#{value}"
    end
  end
end
