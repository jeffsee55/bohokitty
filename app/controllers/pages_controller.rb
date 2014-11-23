class PagesController < ApplicationController
  layout :resolve_layout

  def home
    @post = Post.where(page: "Home").last
    @product =  Product.last;
  end

  def about
    @post = Post.where(page: "About").last
  end

  def contact
    @post = Post.where(page: "Contact").last
  end

  def real_brides
    @post = Post.where(page: "Real Brides").last
  end

  def inspiration
    @post = Post.where(page: "Inspiration").last
    @instagram_recent = Instagram.user_recent_media(ENV['INSTAGRAM_USER_ID'], count: 32)
  end

  private

    def resolve_layout
      case action_name
      when "home"
        "layouts/home"
      when "contact"
        "layouts/basic"
      when "about", "real_brides"
        "layouts/basic-reverse"
      when "inspiration"
        "layouts/grid"
      else
        "layouts/application"
      end
    end
end
