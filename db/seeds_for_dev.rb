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
                      :email    => 'jeremy.hartmann@gmail.com',
                      :password => 'password',
                      :is_admin => true
                  })

# more users

40.times { FactoryGirl.create(:User) }
User.all.each do |u|
  u.confirm
  if rand(3) == 0
    u.profilable = FactoryGirl.create(:InvestorProfile)
  else
    u.profilable = FactoryGirl.create(:UserProfile)
  end
  u.save!
end

# investors and startups
p ' > investors and startups ...'
20.times { FactoryGirl.create(:Enterprise) }

Enterprise.first.attach_user(user, :member, 'Founder')
Enterprise.first.confirm_user(user)
Enterprise.first.save!

user.profilable = FactoryGirl.create(:InvestorProfile)
user.save!

# startup founders and proposals
p ' > startup founders and proposals ...'

Enterprise.all.each do |ent|
  u = User.all.sample
  ent.attach_user(u, :member, FFaker::Lorem.word)
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
  user.save!
end

p '> u.follow(user)'
User.limit(20).each do |u|
  u.follow(user)
  u.save!
end

p ' > Create Enterprise/Business follows'

User.all.each do |u|
  u.follow(Enterprise.all.sample)
  u.save!
end


# micro posts
p ' > micro posts ...'

# (3 + rand(3)).times do
#   User.order('RAND()').each do |u|
#     u.add_micro_post(FFaker::Lorem.sentence)
#     u.save!
#   end
# end

# private messages
p ' > private messages ...'

User.all.each do |u|
  3.times do
    target_user = User.order('RAND()').first
    u.send_private_message(user, FFaker::Lorem.sentence) if rand(5) == 0
    u.send_private_message(target_user, FFaker::Lorem.sentence)
    (1 + rand(1)).times do
      rand(2).times { target_user.reply_private_message(Message.topics.last, FFaker::Lorem.sentence) }
      rand(2).times { u.reply_private_message(Message.topics.last, FFaker::Lorem.sentence) }
    end
  end

  u.sent_messages.order('RAND()').limit(3).each { |msg| msg.mark_as_read! }
  u.sent_messages.order('RAND()').limit(3).each { |msg| msg.mark_as_archived! }
  u.save!
end

p ' > Admin Meeting Schedule'

User.where(profilable_type: "InvestorProfile").each do |a|
 Date::DAYNAMES.each do |today|
   @meeting = AdminMeetingSchedule.create!(investor_profile_id: a.profilable_id,day: today,start_time: (Time.now.beginning_of_day + rand(8..18).hour))
 end
end

p 'Finished creating seeds data for development.'
