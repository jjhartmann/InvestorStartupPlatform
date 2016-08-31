# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require File.dirname(__FILE__) + '/../test/factories/Modelfactories'


p 'Cleaning up temp data ...'

FileUtils.rm_rf(File.join(Rails.root, 'public', 'uploads'))

p 'Finished cleaning up temp data.'

p 'Creating seeds data for development ...'

# primary user
p ' > users ...'

user = FactoryGirl.create(:User, {
                      :username => 'jjhartmann',
                      :name     => 'Jeremy J. Hartmann',
                      :email    => 'test@example.com',
                      :password => 'password'
                  })

# more users

40.times { FactoryGirl.create(:User) }
User.all.each { |u| u.confirm }

# investors and startups
p ' > investors and startups ...'

10.times { FactoryGirl.create(:InvestorProfile) }
20.times { FactoryGirl.create(:Enterprise) }

Enterprise.first.attach_user(user, :member, 'Founder')
Enterprise.first.confirm_user(user)

InvestorProfile.all.each do |investor_profile|
  u = User.new_users.first
  u.profilable = investor_profile
  u.save!
end

user.profilable = FactoryGirl.create(:InvestorProfile)
user.save!

# startup founders and proposals
p ' > startup founders and proposals ...'

Enterprise.all.each do |ent|
  u = User.new_users.first
  ent.attach_user(u, :member, Faker::Lorem.word)
  ent.confirm_user(u)

  if rand(2) == 0
    ent.create_proposal(User.investors.sample, FactoryGirl.build(:Proposal).attributes, 'draft')
  else
    ent.create_proposal(user, FactoryGirl.build(:Proposal).attributes, 'submitted')
  end

  u.save!
  ent.save!
end

# follow/unfollow
p ' > follow/unfollow ...'

User.limit(10).each do |u|
  user.follow(u)
end

User.limit(20).each do |u|
  u.follow(user)
end

# micro posts
p ' > micro posts ...'

(3 + rand(3)).times do
  User.order('RAND()').each do |u|
    u.add_micro_post(Faker::Lorem.sentence)
  end
end

# private messages
p ' > private messages ...'

User.all.each do |u|
  3.times do
    target_user = User.order('RAND()').first
    u.send_private_message(user, Faker::Lorem.sentence) if rand(5) == 0
    u.send_private_message(target_user, Faker::Lorem.sentence)
    (1 + rand(1)).times do
      rand(2).times { target_user.reply_private_message(Message.topics.last, Faker::Lorem.sentence) }
      rand(2).times { u.reply_private_message(Message.topics.last, Faker::Lorem.sentence) }
    end
  end

  u.sent_messages.order('RAND()').limit(3).each { |msg| msg.mark_as_read! }
  u.sent_messages.order('RAND()').limit(3).each { |msg| msg.mark_as_archived! }
end

p 'Finished creating seeds data for development.'
