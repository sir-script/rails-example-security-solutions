require 'spec_helper'

describe User do

  describe "validates data" do
    subject { User.new(@valid_attributes)}

    it { should     accept_values_for(:email, "john@example.com", "lambda@gusiev.com") }
    it { should_not accept_values_for(:email, "invalid", nil, "a@b", "john@.com") }
  end

  it "can authenticate with right mail + password" do
    u1 = User.create!( :name => "dummy", :email => "foo@bar.com", :password => "geheim" )
    u2 = User.authenticate( "foo@bar.com", "geheim" )
    u2.should_not be_nil
    u1.id.should eql(u2.id)
  end

  it "cannot authenticate with wrong password" do
    u1 = User.create!( :name => "dummy", :email => "foo@bar.com", :password => "geheim" )
    u2 = User.authenticate( "foo@bar.com", "falsch" )
    u2.should be_nil
  end

end
