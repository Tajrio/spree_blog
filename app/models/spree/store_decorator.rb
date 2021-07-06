module Spree::StoreDecorator
  def self.prepended(base)
    base.has_and_belongs_to_many :posts, join_table: 'spree_posts_stores'
  end

  Spree::Store.prepend(self) unless Spree::Store.include?(self)
end
