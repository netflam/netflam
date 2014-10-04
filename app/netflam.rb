# NETFLAM                                                                   ---
#
# Version:                                      netflam.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

# Helpers
Dir["./app/helpers/**/*.rb"].each      { |rb| require rb }

# Validators
Dir["./app/validators/**/*.rb"].each   { |rb| require rb }

# Application
Encoding.default_external = 'utf-8'
Encoding.default_internal = 'utf-8'

Netflam.use Rack::Session::Cookie, :key => "nf.session",
                                   :secret => "__a_very_long_string__"
Netflam.use Rack::Static,          :url => ["public"]
Netflam.use Rack::Protection

# Storage
ActiveRecord::Base.establish_connection(YAML::load_file('./config/sqlite.yml'))
$redis = Redis.new(:path => "./tmp/sockets/redis.sock")

# Plugins
Netflam.plugin(Netflam::Render)

# Configure
Netflam.settings[:render][:engine]  = "erb"
Netflam.settings[:render][:views]   = "./views/"
Netflam.settings[:render][:layout]  = "layouts/application"

# Models
Dir["./app/models/**/*.rb"].each       { |rb| require rb }

# Controllers
Dir["./app/controllers/**/*.rb"].each  { |rb| require rb }

# Router
Netflam.define do
  # Basic
  on 'a'      do run Netflam::Controller::Auth end
  on 'c'      do run Netflam::Controller::Comments end
  on 's'      do run Netflam::Controller::Stories end
  on 't'      do run Netflam::Controller::Tags end
  on 'u'      do run Netflam::Controller::Users end
  on true     do run Netflam::Controller::Index end
end