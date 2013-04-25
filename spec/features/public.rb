require "spec_helper"

describe "Public", :type => :feature do

  def article_data
      { :title => "the title", :description => "this is a very important article" }
  end

  it "visitor can read home page" do
    @a = Article.create!( article_data )
    visit "/"
    expect(page).to have_text( "A simple blogging App" )
    expect(page).to have_text( article_data[:title] )
    expect(page).to have_text( article_data[:description] )
  end

  it "visitor can read help page" do
    visit "/static_pages/help"
    expect(page).to have_text( "What should you do with this app?" )
  end

  it "visitor can read articles" do
    @a = Article.create!( article_data )
    visit "/articles"
    expect(page).to have_text( article_data[:title] )
    expect(page).to have_text( article_data[:description] )
  end
end
