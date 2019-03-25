require 'faker'
FactoryBot.define do
	factory :user do
		factory :valid_user do
			name {Faker::Name.name}
			username {Faker::Internet.username}
			email {Faker::Internet.email}
			password {Faker::Internet.email}
		end
	end
end