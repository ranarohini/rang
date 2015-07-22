class Product < ActiveRecord::Base
  validates_presence_of :name, :description, :image_url, :price

    # Searches movies
  def self.search(search)
    if search
      Product.where('name LIKE ?', "%#{search}%")
    else
      Product.all
    end
  end
end
