require "bundler/capistrano"
require 'capistrano/ext/multistage'
load 'deploy/assets'

set :application, 'patient_list'
set :scm,         :git
set :repository,  "git@github.com:neo/nhs-patientlist.git"
set :use_sudo,    false

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# deployment servers
server = "patientlist.newcontext.co.uk"
role :web, server                    # Web server (Nginx)
role :app, server                    # App server (unicorn)
role :db,  server, :primary => true  # db server  (postgres)
