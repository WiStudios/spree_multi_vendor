module Spree::ProductPropertyDecorator
  def property_name=(name)
    if name.present?
      # don't use `find_by :name` to workaround globalize/globalize#423 bug
      self.property = Spree::Property
                      .where(name: name, vendor_id: product.try(:vendor_id))
                      .first_or_create(presentation: name)
    end
  end
end

# Commented this code because above modifications restricts us to save any product property
#Spree::ProductProperty.prepend Spree::ProductPropertyDecorator
