# knitting_patterns_rails

Knitting Patterns Rails is a Ruby on Rails web application that lets you add a knitting pattern and share it with other users that are signed into the application (https://github.com/Christy743/knitting_patterns_rails)

Users can make an account to store their patterns. The application will display a list of patterns. Each pattern will be displayed with directions, yarns, needles and any other materials that are needed to complete that knitted item.

Users can create, read, update or delete their own patterns.

All user data is validated using ActiveRecord ORM and Rails model validations.

Users can sign in, sign out and can also sign in by GitHub without having to always putting in their email and password.

Installation

Fork and clone this repository.

Then execute:

  $ bundle install
  $ rake db:migrate

Then run:

  $ rails s

Open a web browser and navigate to:

  localhost:3000

# Models

  This app uses # ActiveRecord Models: ```User, Pattern, Comment, FavoritePattern```. The join table is ```favorite_patterns```.

  User:
    ```
    has_many :patterns
    has_many :favorite_patterns, dependent: :destroy
    has_many :favorites, through: :favorite_patterns, source: :pattern
    ```

  Pattern:
    ```
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :favorite_patterns, dependent: :destroy
    has_many :favorited_by, through: :favorite_patterns, source: :user
    ```

  Comment:
    ```
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable
    ```

  FavoritePattern:
    ```
    belongs_to :user
    belongs_to :pattern
    ```

  ## Contributing

  Bug reports and pull requests are welcome on GitHub at https://github.com/Christy743/knitting_patterns_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

  ## License

  The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

  ## License

  The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

* Ruby version: ruby 2.3.1
