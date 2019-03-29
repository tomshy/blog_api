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

FactoryBot.define do
	factory :post do
		factory :valid_post do
			title {Faker::Lorem.sentence}
			body {Faker::Lorem.paragraph}
			association :user, factory: :valid_user
		end
	end
end

FactoryBot.define do
	factory :comment do
		factory :valid_comment do
			association :post, factory: :valid_post
			association :user, factory: :valid_user
			title {Faker::Lorem.sentence}
			body {Faker::Lorem.paragraph}			
		end
	end
end