## Ruby on Rails
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

## Rails Generator

<p align="center"><img style="display: block; width: 600px; margin: 0 auto;" src=img/2020-10-14-11-09-34.png alt="no image found"></p>

```ruby
rails generate [model|controller|resource|scaffold] [name]
rails destroy [model|controller|resource|scaffold] [name]
```
### Model
```ruby
rails g model hello
```
- **model** 
- **migration**
- test

### Controller
```ruby
rails g controller hello
rails g controller hello index
```
- **controller**
- **route**
- **view**
- test
- helper
- assets

### Resource
```ruby
rails g resource hello
```
- **migration**
- **model**
- **route**
- **controller**
- **views empty folder**
- test
  
### Scaffold
```ruby
rails g scaffold hello
```
- **model**
- **migration**
- **route**
- **controller**
- **view**
- **jbuilder**
- test
- helper
- assets

### Disable Unwanted Rails Generators 
```ruby
# config/application.rb
class Application < Rails::Application

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.test_framework false
    end
  end
end
```


## Ruby Bricks
### Inspect
- debugger
- [Docs](https://www.rubyguides.com/2018/12/ruby-inspect-method/)
```ruby
stock = StockQuote::Stock.quote("fb")
stock.inspect
```

### Nil or?
```ruby
a = nil
b = []
c = ""

a.blank? #=> true
b.blank? #=> true
c.blank? #=> true

d = "1"
e = ["1"]

d.blank? #=> false
e.blank? #=> false
```
## Rails Bricks
### Rails Routes
```ruby
# basic syntax
get 'home/index', to: 'home#index' # localhost:3000/home/index
get 'home/index' # localhost:3000/home/index

# set default controller for home page
root 'home#index'
root to: 'home#index'
```

### Rails Links
```ruby
<%= link_to label, path %>
```

### Rails Hash
- ugly
```ruby
:locals => { :label => "About", :path => "about" }
```
- the same
```ruby
locals: { label: "Home", path: "" }
```

### Get path as variable
```sh
rake routes # prefix colmun
```
- for example
```ruby
# prefix for about page is 'about', so the path will be 
about_path # just append _path
```

### Rails Partials
- resuable html(erb)
- filename starts with "_" `views/shared/_logo.html.erb`
```ruby
# without params
<%= render partial: "shared/nav" %>
# with params
<%= render partial: "shared/navlink", locals: { label: "About", path: about_path } %>
```


## VScode Extensions
- ERB-VSCode-Snippets
  - `pe`, `pc`, `pre`
- Bootstrap v4 Snippets
  - configre shortcut
  - change language mode `cmd + '`
  - example: `b-form-group`
- ERB Formatter/Beautify
## GEM: Stock-Quote
- api_key: `pk_0313c10270d2436cafc50b6b5e341181`

## Reference
- [Integrate Tailwind into Ruby on Rails](https://web-crunch.com/posts/how-to-install-tailwind-css-using-ruby-on-rails)
- [Reduce Application Clutter, Disable Unwanted Rails Generators](https://thoughtbot.com/blog/reduce-application-clutter-disable-unwanted-rails)
- [Ruby Blocks](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/)
- [Better Template Engine](https://haml.info/tutorial.html)
- [Add Bootstrap to Rails](https://github.com/twbs/bootstrap-rubygem)
