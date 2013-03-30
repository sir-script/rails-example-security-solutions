describe "Midi", :type => :feature do

  it "the home page is available" do
    visit "/"
    expect(page).to have_text("rails")
  end

end
