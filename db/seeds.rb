DEFAULT_PASSWORD = 123456 

Admin.find_or_create_by(email: 'admin@admin.com') do |admin|
  admin.password = DEFAULT_PASSWORD
  admin.password_confirmation = DEFAULT_PASSWORD
end

User.find_or_create_by(email: 'user@user.com') do |user|
  user.password = DEFAULT_PASSWORD
  user.password_confirmation = DEFAULT_PASSWORD
end