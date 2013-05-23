require "spec_helper"

describe "Articles", :type => :request do

 def article_data
      { :title => "the title", :description => "<script>alert('servus leitlen')</script>", :user_id => 5 }
  end
  def user_data
      { :name => "the tester", :email => "foo@bar.com", :password => "1234567" }
  end
 it "should not create from unlogged users" do 
    post "/articles", :article =>  article_data
    a=Article.find_by_title(article_data[:title])
   	a.should be_nil
  end
  it "should have always the right user_id" do
  	u=User.create(user_data)
  	
  	u2=User.authenticate(user_data[:email],user_data[:password]);
		u2.should_not be_nil

		user_id=u2.id
		post "/sessions", :email => user_data[:email], :password => user_data[:password]

  	post "/articles", :article =>  article_data
  	a=Article.find_by_title(article_data[:title])
  	a.should_not be_nil
  	a.user_id.should == user_id
  end
end
