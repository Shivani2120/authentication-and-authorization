Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'Nicole',
								    email: 'admin@gmail.com',
				                    password: 'password1234',
								    password_confirmation: 'password1234')
user1.add_role(:admin)
user2 = User.create(username: 'Bruce',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user2.add_role(:client)
user1 = User.first
user2 = User.second
1.upto(5) do |i|
	p = Product.new(name: "monitor #{i}",
								 price: 600 * i,
								 user_id: user1.id)
    if p.save
        puts "Product: #{p}"
    else
        puts p.errors.full_messages
    end
end
1.upto(5) do |i|
	p = Product.new(name: "keyboard #{i}",
								 price: 200 * i,
								 user_id: user2.id)
    if p.save
        puts "Product: #{p}"
    else
      puts p.errors.full_messages
    end
end