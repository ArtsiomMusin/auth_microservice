(1..3).each do |i|
  user = User.create(
    name: "Username#{i}", email: "test#{i}@test.com", 
    password: 'fake', password_confirmation: 'fake'
  )

  UserSession.create(user_id: user.id)
end
