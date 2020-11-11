## Generator
<p align="center"><img style="display: block; width: 600px; margin: 0 auto;" src=../img/2020-10-14-11-09-34.png alt="no image found"></p>

```sh
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

### References
- [Reduce Application Clutter, Disable Unwanted Rails Generators](https://thoughtbot.com/blog/reduce-application-clutter-disable-unwanted-rails)

