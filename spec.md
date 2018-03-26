# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project -//// used the terminal to make a skeletal form of rails by typing in "rails new knitting_patterns_rails".
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) -//// made a model with the user and it's association with patterns in that user has_many :patterns and has_many :favorites. Pattern model has_many :favorited_by association.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) -//// patterns belongs_to :user and made the pattern model to reflect that association and my favorite_pattern model has a belongs_to :user and belongs_to :pattern association
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) -//// have a one has_many through: relationship with :favorite_patterns and user model has_many :favorite_patterns and has_many :favorites through: :favorite_patterns and the source: is :pattern. The pattern model has_many :favorite_patterns and has_many :favorited_by, through: :favorite_patterns and the source: is :user.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) -//// added an attribute to the favorite_patterns join table so that attribute_name e.g. favorite_patterns.my_favorite
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -//// Validated email, name, etc in my user model.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -//// have a GET route for    /patterns/:id/favorite_patterns/:id 
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) -//// have a custom attribute writer in the pattern model for favorite_patterns_attributes
- [x] Include signup (how e.g. Devise) -//// Used Devise at first found it to be a bit more magical and I decided to start over with no Devise.  Much better because I can see how the custom way versus the Devise way.
- [x] Include login (how e.g. Devise) -//// Custom methods to log in with sessions and users controllers and user model methods - made a sessions controller and view for signing into the application.
- [x] Include logout (how e.g. Devise) -//// made the destroy method in sessions controller so when user logs out the session is deleted.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -//// Used OmniAuth-GitHub strategy and followed the lecture from Avi.  Have a better understanding of how it works after over a few days trying to make it work with Devise and then without Devise.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -//// have nested resources for comments and for /patterns/:id/favorite_patterns/:id.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) -//// made a nested resource for comments with the URL /patterns/10/comments/new.
- [x] Include form display of validation errors (form URL e.g. /recipes/new) -//// I successfully put in code in my new pattern form to alert the user if the fields are blank. I used CSS to show these messages in either red or purple.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
