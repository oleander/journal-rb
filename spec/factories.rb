FactoryGirl.define do
  factory :user do
    name "Linus"
  end
  
  factory :user_with_project, parent: :user do
    after_build do |user|
      user.projects << FactoryGirl.build(:project)
    end
  end
  
  factory :project do
    name "My Custom Project"
  end
end