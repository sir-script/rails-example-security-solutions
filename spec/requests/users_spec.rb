require "spec_helper"

describe "Users", :type => :request do

  describe "EVIL TEST: create a user" do

    it "with admin rights" do
      post "/users", :user => { :name => 'arri', :email => 'foo1@bar1.com', :password => 'secret', :is_admin => '1'}
      expect(response.status).to eql(302)  # http redirect when create succeeds

      u = User.find_by_email('foo1@bar1.com')
      u.should_not be_nil
      u.name.should == 'arri'
      u.is_admin.should be_true
    end

  end
end
