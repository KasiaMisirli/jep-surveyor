# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Coles
Account.create!([{ name:"Coles", id:"coles" }])
Survey.create!([{ name:"Coles Survey", account_id:"coles",id:"coles_survey"}])
User.create!([
  { email:"kasia@gmail.com", password:"kasia", account_id:"coles"},
  { email:"jake@gmail.com", password:"jake", account_id:"coles"},
  { email:"caz@gmail.com", password:"caz", account_id:"coles"},
  { email:"jody@gmail.com", password:"jody", account_id:"coles"}
])


# Culture Amp
Account.create!([{ name:"Culture Amp", id:"cultureamp" }])
Survey.create!([{ name:"Culture Amp Survey", account_id:"cultureamp",id:"cultureamp_survey"}])
User.create!([
  { email:"nick@gmail.com", password:"nick", account_id:"cultureamp"},
  { email:"todd@gmail.com", password:"todd", account_id:"cultureamp"},
  { email:"ryan@gmail.com", password:"ryan", account_id:"cultureamp"},
  { email:"tanim@gmail.com", password:"tanim", account_id:"cultureamp"}
])

@coles_question_list = [
  ["How many days off do you need?","work","coles_survey"],
  [ "Do you like to work in a team?","teamwork","coles_survey"],
  ["How long have you worked here?","time","coles_survey"],
  ["Do you feel like you progress in your development?","self-development","coles_survey"]
]
@culture_amp_question_list = [
  ["How many ppl do you like to have in your team?","work","cultureamp_survey"],
  [ "Do you like to work alone?","teamwork","cultureamp_survey"],
  ["How long do you plan to work here?","time","cultureamp_survey"]
]

@coles_question_list.each do |title, tag, survey_id|
  RatingQuestion.create!([{ title: title, tag: tag, survey_id:survey_id}])
end

@culture_amp_question_list.each do |title, tag, survey_id|
  RatingQuestion.create!([{ title: title, tag: tag, survey_id:survey_id}])
end