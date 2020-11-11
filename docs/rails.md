## Rails
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