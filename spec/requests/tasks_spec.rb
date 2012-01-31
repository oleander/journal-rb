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

describe "Project" do
  it "should display a new project link" do
    visit root_path
    page.should have_content("New project")
  end
  
  it "should be possible to create a project" do
    visit root_path
    click_link "New project"
    fill_in "Name", with: "My Super Project"
    click_button "Create Project"
    page.should have_content("My Super Project")
  end
end