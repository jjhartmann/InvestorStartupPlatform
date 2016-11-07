# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = FactoryGirl.create(:User, {
    :username => 'admin',
    :name     => 'NetPlus Admin',
    :email    => 'admin@netplus.com',
    :password => 'password',
    :is_admin => true
})

user.profilable = FactoryGirl.create(:UserProfile)
user.save!



# Questions to ask
QuestionsToAskEntrepreneur.create(question: 'Deal with Lowest Budget')
QuestionsToAskEntrepreneur.create(question: 'Fields of Major deals')
QuestionsToAskEntrepreneur.create(question: 'Fields of Interest for investment')
QuestionsToAskInvestor.create(question: 'Fields of Interest for investment')
QuestionsToAskInvestor.create(question: 'Minimum Budget for investment')
QuestionsToAskInvestor.create(question: 'Maximum Budget for investment')
QuestionsToAskInvestor.create(question: 'What startup type are you looking for?', qtype: 'dropdown')
QuestionsToAskEnterprise.create(question: 'Fields of Interest for investment')
QuestionsToAskEnterprise.create(question: 'Maximum Budget for investment')
QuestionsToAskEnterprise.create(question: 'Maximum Budget for investment')

