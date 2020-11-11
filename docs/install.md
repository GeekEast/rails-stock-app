### Install
- Install rbenv `brew install rbenv`, `rbenv init`
- Install ruby `rbenv install 2.6.3`
- Install rails `gem install -v 5.2.4.1`

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
