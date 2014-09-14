# Core
require "rake"            # CLI
require "unicorn"         # Server

# Storage
require "active_record"   # Database
require "redis"           # Cache

# Modules
require "rack-protection" # Security

# Libraries
require "yaml"

# Application
require "./app/netflam"   # Netflam

run Netflam