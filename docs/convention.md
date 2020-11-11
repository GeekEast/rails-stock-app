## Convention over Configuration
### General Ruby Convention
- Class Name: `CamelCase`
- Methods: `snake_case`
- Variables: `snake_case`
- `method?`: will return `boolean` anyway
- `method!`: will throw `exception` if possible
- `class::method`: `class` method
- `class#method`: `instance` method

### Rails Convention
- **Database**
  - Table Name: `snake_cases` 
  - Column Name: `snake_case` 
- **Model**
  - File Name: `snake_case.rb`
  - Class Name: `CamelCase`
  - Attribute: `snake_case`
  - Method: `snake_case`
  - Relation: `snake_case`: `has_one`, `belongs_to`, `has_many`
- **Controller**
  - File Name: `snake_cases_controller.rb`
  - Class Name: `CamelCasesController`
  - Action: `snake_case`: `index`, `show`, `new`, `create`, `edit`, `update`,`delete`
- **Route**
  - Resource Name: `snake_cases` or [`snake_case`](https://edgeguides.rubyonrails.org/routing.html#singular-resources)
- **View**
  - File Name: `snake_case.html.erb`
- **Generator**
  - Model: `CamelCase`, same as **Model Class Name** Convention
  - Controller: `CamelCases`
  - Resource: `CamelCase`
  - Scaffold: `CamelCase`
  - `Controller`|`Model`|`Resource`|`Scaffold` Attribute: `snake_case`
  - Migration: `CamelCase` or `snake_case`, singular or plural depends
    - `rails g migration AddUnitCostToProducts unit_cost:integer`
    - `rails g migration add_unit_cost_to_products unit_cost:integer`

