## Ruby
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

### Hash
- ugly
```ruby
:locals => { :label => "About", :path => "about" }
```
- the same
```ruby
locals: { label: "Home", path: "" }
```


### References
- [Ruby Blocks](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/)
