# knitting_patterns_rails

Knitting Patterns Rails is a Ruby on Rails web application that lets you add a knitting pattern and share it with other users that are signed into the application (https://github.com/Christy743/knitting_patterns_rails)

Users can make an account to store their patterns. The application will display a list of patterns. Each pattern will be displayed with directions, yarns, needles and any other materials that are needed to complete that knitted item.

Users can create, read, update or delete their own patterns.

All user data is validated using ActiveRecord ORM and Rails model validations.

Users can sign in, sign out and can also sign in by GitHub without having to always putting in their email and password.

##Installation

Fork and clone this repository.

Then execute:

  $ bundle install
  $ rake db:migrate

Then run:

  $ rails s

Open a web browser and navigate to:

  localhost:3000

# Models

  This app uses # ActiveRecord Models: ```User, Pattern, Comment```. The join table is ```put join table```.

  User:
    ```
    has_many :patterns
    has_many :comments
    ```

  Pattern:
    ```
    has_many :users
    ```

  Comment:
    ```
    belongs_to :user
    belongs_to :pattern
    ```

  ## Contributing

  Bug reports and pull requests are welcome on GitHub at # Models

  This app uses 5 ActiveRecord Models: ```User, Coin, Wallet, Transaction, and CryptocompareApi```. The join table is ```Transaction```.

  User:
    ```
    has_many :transactions
    has_many :coins, through: :transactions
    has_many :wallets
    ```

  Coin:
    ```
    has_many :transactions
    has_many :users, through: :transactions
    has_many :wallets

    validates :name, :symbol
    ```

  Wallet:
    ```
    belongs_to :user
    belongs_to :coin

    validates :name, :coin_amount, :user_deposit (presence, and greater than 0)
    ```

  Transaction:
    ```
    belongs_to :user
    belongs_to :coin

    validates :amount, :quantity, :price_per_coin, :fee (presence, and greater than 0)
    ```

  Cryptocompare API:

    ```
    Uses custom methods, to parse real-time price data, symbols, coin names, and coin IDs.
    ```

  ## Contributing

  Bug reports and pull requests are welcome on GitHub at https://github.com/Christy743/knitting_patterns_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

  ## License

  The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

  ## License

  The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
