server "54.65.228.79", user: "ec2-user", roles: %w{db}

#set :ssh_options, { auth_methods: ['publickey'], forward_agent: true, keys: ['~/.ssh/raise.pem'] }
