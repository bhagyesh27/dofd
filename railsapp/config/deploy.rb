require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'


set :domain,     '127.0.0.1'
set :deploy_to,  "/home/ubuntu/app"
set :app_path,   "/home/ubuntu/app/current"
set :repository, 'https://github.com/bhagyesh27/dofd.git'
set :branch,     'master'


task :local_environment do
   invoke :'rbenv:load'
end

task deploy: :local_environment do

   deploy do
      invoke :'git:clone'
      invoke :'bundle:install'
   end
end