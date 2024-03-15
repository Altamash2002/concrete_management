# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

(use GitHub-Desktop or git to clone)
hiranandani_conerete_qa
open terminal in the root folder

* Ruby version

rvm install 3.1.0


## Steps to run locally
* Use right RVM version
```
rvm use 3.0.0
```

* Install Bundle
```
bundle install
```

* Database creation

```
edit database.yml to match your local postgres setup
rails db:create
rails db:migrate
```

* Seed Admin User
```
rails db:seed
```

* Install right master key

Get the master key from the team and put it in the config folder. 
```
1. Create master.key file in config directory
2. Paste the shared key in the file
3. Save the file
```

* Run things locally
```
./bin/dev
```

## Steps to run on Production

* Login to Server

```
ssh root@qa-dashboard.ssingularity.co.in
```
You will need the password for the server. Ask the team for it.

* Go to the project directory

```
cd /var/www/rails_apps/hiranandani_conerete_qa
```

* Pull the latest code

```
git pull origin master
```

* Find the container id of

```
docker ps | grep hiranandani_conerete_qa_app
```
Fetch first value of the tab separated output as container id

e.g.
```
50aa4eb38f7a        hiranandani_conerete_qa_app                    "bash -c 'bundle exe…"   2 days ago          Up 2 days           0.0.0.0:9069->9069/tcp               hiranandani_conerete_qa_app_1
```

50aa4eb38f7a from the above output is the container id

* Start the bash of the container

```
docker exec -it <container_id> bash
e.g. 
docker exec -it 50aa4eb38f7a bash
```

* Bundle install

```
bundle install
```

* Migrate the database

```
rails db:migrate
```

* Precompile the assets

```
rails assets:precompile
```

* Restart the server

```
rails restart
```



