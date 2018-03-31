if Rails.env.development?
  admin = User.create!(
      email: 'admin@queueoverflow.com',
      password: 'password',
      password_confirmation: 'password',
      nickname: 'Admin',
      fullname: 'Boyarsksikh Nikita'
  ).add_role('admin')
end
