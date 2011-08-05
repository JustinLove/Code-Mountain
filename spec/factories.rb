Factory.sequence :email do |n|
  "user_#{n}@example.com"
end

Factory.define :lesson do |lesson|
end

Factory.define :task do |task|
  task.lesson {|t| t.association(:lesson)}
  task.user {|t| t.association(:user)}
end

Factory.define :user do |user|
  user.name 'John Doe'
  user.email {Factory.next(:email)}
  user.password 'password'
end
