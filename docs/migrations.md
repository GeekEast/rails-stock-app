- [Templates](#templates)
  - [AddColumnToTable](#addcolumntotable)
  - [RemoveColumnFromTable](#removecolumnfromtable)
  - [CreateTable](#createtable)
  - [AddModelRefToModel](#addmodelreftomodel)
  - [CreateJoinTableTable1Table2](#createjointabletable1table2)
- [Modifiers](#modifiers)
- [Operations](#operations)
- [Summary](#summary)

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
    # create a user_id in products table
    add_reference :products, :user, type: :uuid, foreign_key: true
  end
end
```

### CreateJoinTableTable1Table2
```ruby
rails g migration CreateJoinTableCustomerProduct customer product
```

## Types
```ruby
create_table :users do |t|
  t.string
  t.text
  t.integer
  t.float
  t.decimal
  t.datetime
  t.timestamp
  t.time
  t.date
  t.binary
  t.boolean
end
```



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

## Operations
- `add_column`
- `add_foreign_key`
- `add_index`
- `add_reference`
- `add_timestamps`
- `change_column_default` (must supply a :from and :to option)
- `change_column_null`
- `create_join_table`
- `create_table`
- `disable_extension`
- `drop_join_table`
- `drop_table` (must supply a block)
- `enable_extension`
- `remove_column` (must supply a type)
- `remove_foreign_key` (must supply a second table)
- `remove_index`
- `remove_reference`
- `remove_timestamps`
- `rename_column`
- `rename_index`
- `rename_table`


## Summary
- `add_reference :products, :user` will add `user_id` in prodcuts table
```ruby
# sentence 1 = sentence 2 = sentence 3
create_table :accounts do |t|
  # sentence 1
  t.belongs_to :supplier
  # sentence 2
  t.references :user, foreign_key: true
  t.string :account_number
  t.timestamps
end

# sentence 3
add_reference :accounts, :supplier
```
