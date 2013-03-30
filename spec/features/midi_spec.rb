describe "Homepage", :type => :feature do

  it "the home page is available" do
    visit "/"
    expect(page).to have_text("Artikel")
  end

end
