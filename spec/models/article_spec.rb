require 'spec_helper'

describe Article do
  it "must have a title" do
    a = Article.create( :title => "", :description => "ok ok" )
    a.id.should be_nil
    a.errors.should_not be_nil
    a.errors.messages[:title].should include "is too short (minimum is 5 characters)"
  end
end
