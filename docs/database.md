## Database Design
### Stock
- ticker: string
- user_id: number with index
```sh
rails generate scaffold Stock ticker:string user_id:integer:index
```

## CRUD
```sh
rails db # run sql
rails console # run rails
```

## Associations

### One to One
- belongs to
```ruby
# will create FK in author table
class Book < ApplicationRecord
    belongs_to :author
end
```
- has_one
```ruby
class Supplier < ApplicationRecord
  has_one :account
end
```
- has_one:through
```ruby
class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
end
 
class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_history
end
 
class AccountHistory < ApplicationRecord
  belongs_to :account
end
```
### One to Many
- has_many
```ruby
class Author < ApplicationRecord
    # you can create books via author
    # delete one author will automatically delete it's books
    has_many :books, dependent: :destroy
end
```
### Many to Many
- has_many:through (you care about the intervening model)
```ruby
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
 
class Appointment < ApplicationRecord
  # belongs to, not has_many
  belongs_to :physician
  belongs_to :patient
end
 
class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
```

- has_and_belongs_to (you don't care about the intervening model)
```ruby
# assemblies_parts table will be created automatically
class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end
 
class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end
```

### Polymorphic
- **Monomorphic**: a picture can be attached to only Employee type
- **Polymorphic**: a picture can be attached to either an Employee or Product type
```ruby
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
 
# can be taken as a Picture
class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end
 
# an be taken as a Picture
class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end
```
<p align="center"><img style="display: block; width: 600px; margin: 0 auto;" src=img/2020-11-13-10-55-08.png alt="no image found"></p>


### Self-Join
- Employee has managers or subordinates
```ruby
class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
 
  belongs_to :manager, class_name: "Employee", optional: true
end
```

## Issues
- Do I need to manually create migration after modify the model?

## Reference
- [Rails Associations](https://guides.rubyonrails.org/association_basics.html)
