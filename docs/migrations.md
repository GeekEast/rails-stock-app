- [DB CLI](#db-cli)
- [Helpers](#helpers)
- [Field Types](#field-types)
- [Column Modifiers](#column-modifiers)
- [Migaration Generator](#migaration-generator)
  - [AddColumnToTable](#addcolumntotable)
  - [RemoveColumnFromTable](#removecolumnfromtable)
  - [CreateTable](#createtable)
  - [AddModelRefToModel](#addmodelreftomodel)
  - [CreateJoinTableTable1Table2](#createjointabletable1table2)
  - [Model and Scaffold Generator](#model-and-scaffold-generator)
- [Reverse Manually](#reverse-manually)
- [Experience](#experience)

## DB CLI
```ruby
rails db:setup

# migrate
rails db:migrate
rails db:migrate VERSION=20080906120000
rails db:migrate RAILS_ENV=test

rails db:rollback

rails db:reset
```
## Helpers
- [`create_table`](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-create_table)
- [`create_join_table`](https://edgeguides.rubyonrails.org/active_record_migrations.html#creating-a-join-table): create `has_and_belongs_to` association
- [`change_table`](https://edgeguides.rubyonrails.org/active_record_migrations.html#changing-tables)
- [`change_column`](https://edgeguides.rubyonrails.org/active_record_migrations.html#changing-columns)
- [`change_column_default`](https://edgeguides.rubyonrails.org/active_record_migrations.html#changing-columns): **irreversible**
- [`change_column_null`](https://edgeguides.rubyonrails.org/active_record_migrations.html#changing-columns): **irreversible**
- [`add_foreign_key`](https://edgeguides.rubyonrails.org/active_record_migrations.html#foreign-keys)
- [`remove_foreign_key`](https://edgeguides.rubyonrails.org/active_record_migrations.html#foreign-keys)
  
- `add_column`
- `remove_column`

- `add_index`
- `remove_index`

- `add_reference`
- `remove_reference`

- `add_timestamps`
- `remove_timestamps`

- `drop_join_table`
- `drop_table`

- `enable_extension`
- `disable_extension`

- `rename_column`
- `rename_index`
- `rename_table`
- [Arbitrary SQL](https://edgeguides.rubyonrails.org/active_record_migrations.html#when-helpers-aren-t-enough)
```ruby
Product.connection.execute("UPDATE products SET price = 'free' WHERE 1=1")
```
## Field Types
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
## Column Modifiers
- used when `create` or `change` a **column**
- could be passed on type definitions, ie `price:decimal{5,2}`, `supplier:references{polymorphic}`
- enclosed by `{...}`
```ruby
# 多个modifiers需要加 ''
rails generate migration AddDetailsToProducts 'price:decimal{5,2}' supplier:references{polymorphic}
```
- `limit`: maximum size of `string`/`text`/`binary`/`integer` fields
- `precision`: total number of digits in a `decimal` number
- `scale`: number of digits after `decimal` point
- `polymorphic`: add type column for `belongs_to` associations
- `null`: allow `null` or not
- `default`: `default` value
- `comment`: add a `comment` on the column


## Migaration Generator
### AddColumnToTable
```ruby
# single
rails generate migration AddPartNumberToProducts part_number:string
# indexed col
rails generate migration AddPartNumberToProducts part_number:string:index
# multiple fields
rails generate migration AddDetailsToProducts part_number:string price:decimal
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
# reference = belongs to
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

### Model and Scaffold Generator
- Model Generator will trigger `Create` Migration
- Scaffold Generator will trigger `Create` Migration
```ruby
# name:string ... is same in migration template
rails generate Product name:string description:text
```

## Reverse Manually
- sometimes `rails` [don't know how to reverse](https://edgeguides.rubyonrails.org/active_record_migrations.html#using-reversible)
```ruby
class ExampleMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :distributors do |t|
      t.string :zipcode
    end

    reversible do |dir|
      # how to change
      dir.up do
        execute <<-SQL
          ALTER TABLE distributors
            ADD CONSTRAINT zipchk
              CHECK (char_length(zipcode) = 5) NO INHERIT;
        SQL
      end
      # how to reverse
      dir.down do
        execute <<-SQL
          ALTER TABLE distributors
            DROP CONSTRAINT zipchk
        SQL
      end
    end

    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end
end

```
## Experience
- `add_reference :products, :user` will add `user_id` in **products** table
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
