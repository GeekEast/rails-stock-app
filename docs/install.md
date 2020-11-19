### Install
- Install rbenv 
  - `brew install rbenv`
  - `rbenv init`
- Install ruby 
  - `rbenv install 2.6.3`
  - `rbenv global 2.6.3`
- Install rails 
  - `export GEM_HOME="$HOME/.gem"`
  - `gem install rails -v 5.2.3`
  - `rbenv rehash`
### Database
- Install
```sh
# uninstall
brew uninstall postgresql
brew doctor
brew cleanup

# optional
rm -r /usr/local/var/postgres
rm -r /Users/xiangtan/Library/Application\ Support/Postgres

# install
brew install postgresql

# start as service
brew services start postgresql
```
- Config `database.yml`
```yaml
username: <mac's username>
password:
host: localhost
port: 5432
```
- create database `rails db:create`
