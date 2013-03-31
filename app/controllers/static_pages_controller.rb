class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def help
  end
end
