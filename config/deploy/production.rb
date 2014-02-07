set :stage, :production
set :rails_env, "production"
set :domain, "welcometoiona.com"
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.

# role :web,          "%w{deploy@178.79.130.211}"
# role :app,          "%w{deploy@178.79.130.211}"
# role :db,           "%w{deploy@178.79.130.211}", :primary => true

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
# server '178.79.130.211', user: 'deploy', roles: %w{web app}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
server '198.58.112.15',
  user: 'deploy',
  roles: %w{web app db},
  primary: true,
  ssh_options: {
    user: 'deploy', # overrides user setting above
    keys: %w(/Users/omar/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: %w(s4cr4m3nt0)
  }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :staging)
