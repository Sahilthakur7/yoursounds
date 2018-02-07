User.create!(
    username: 'testuser12',
    password: '15151515',
    password_confirmation: '15151515',
    email: 'testuser12@gmail.com',
    avatar: File.open(File.join(Rails.root,'image.png'))
)
puts "1 User created"
