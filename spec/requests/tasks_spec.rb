describe "User" do
  it "should create a user" do
    visit root_path
    User.first.uuid.should_not be_nil
  end
  
  it "should not create a new user for each request" do
    2.times { visit root_path }
    User.count.should eq(1)
  end
end