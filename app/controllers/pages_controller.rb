class PagesController < ApplicationController
  layout :resolve_layout

  def home
    @post = Post.where(page: "Home").last
    @products =  Product.last(3);
  end

  def about
    @post = Post.where(page: "About").last
  end

  def contact
    @post = Post.where(page: "Contact").last
    @message = Message.new
  end

  def real_brides
    @posts = Post.where(page: "Real Brides")
  end

  def inspiration
    @post = Post.where(page: "Inspiration").last
    @instagram_recent = Instagram.user_recent_media(ENV['INSTAGRAM_USER_ID'], count: 33)
  end

  private

    def resolve_layout
      case action_name
      when "home", "real_brides"
        "layouts/home"
      when "contact"
        "layouts/basic"
      when "about"
        "layouts/basic-reverse"
      when "inspiration"
        "layouts/grid"
      else
        "layouts/application"
      end
    end
end
