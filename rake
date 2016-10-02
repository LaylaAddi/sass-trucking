sudo service postgresql restart
rake db:drop db:create db:migrate 
rake db:seed
