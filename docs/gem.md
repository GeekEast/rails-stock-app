## GEM
### [Stock-Quote](https://github.com/tyrauber/stock_quote)
- retrieve stock quotes from IEX
- api_key: `pk_0313c10270d2436cafc50b6b5e341181`
### [Devise](https://github.com/heartcombo/devise)
> Flexible authentication solution
- add following line to Gemfile `gem 'devise'`
- run generator `rails generate devise:install`
- setup default url in `development.rb` 
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
- generate db migration files `rails generate devise User`
- migrate database `rails db:migrate`

