module Spree
  class PostsController < StoreController
    helper 'spree/products'

    def index
      @posts = Spree::Post.by_store(current_store).available.order(created_at: :desc)
    end

    def show
      if current_spree_user.present? && current_spree_user.admin?
        @post = Spree::Post.friendly.find(params[:id])
      else
        @post = Spree::Post.by_store(current_store).available.friendly.find(params[:id])
      end
      @title = @post.title
    end

  end
end
