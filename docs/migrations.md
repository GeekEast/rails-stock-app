## Templates
### AddColumnToTable
```ruby
rails generate migration AddPartNumberToProducts part_number:string
rails generate migration AddPartNumberToProducts part_number:string:index
```
### RemoveColumnFromTable
```ruby
rails generate migration RemovevPartNumberFromProdcuts part_number:string price:decimal
```

### CreateTable
```ruby
rails generate migration CreateProducts name:string part_number:string
```


### AddModelRefToModel
```ruby
rails generate migration AddUserRefToProducts user:references

# generate
class AddUserRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :user, foreign_key: true
  end
end
```

### CreateJoinTableTable1Table2
```ruby
rails g migration CreateJoinTableCustomerProduct customer product
```

## Operations
- create table: `create_table`
- create join table: `create_join_table`
- change table: `change_table`
- change column: `change_column`
- add foreign key: `add_foreign_key`
- remove foreign key: `remove_foreign_key`

## Modifiers
```ruby
# 多个参数需要加 ''
# references = belongs to 
rails generate migration AddDetailsToProducts 'price:decimal{5,2}' supplier:references{polymorphic}
```
- limit: maximum size of string/text/binary/integer fields
- precision: total number of digits in a decimal number
- scale: number of digits after decimal point
- polymorphic: add type column for belongs_to associations
- null: allow null or not
- default: default value
- comment: add a comment on the column