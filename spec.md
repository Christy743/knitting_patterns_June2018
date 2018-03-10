# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - used the terminal to make a skeletal form of rails by typing in "rails new knitting_patterns_rails".
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - made a model with the user and it's association with patterns in that user has many patterns
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - patterns belongs to user and made the pattern model to reflect that association
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - have a one has many through relationship with favorite patterns and user has many favorite patterns and has many favorites through favorite patterns and the source is pattern. The pattern has many favorite patterns and has_many favorited by, through favorite_patterns and the source will be the user.
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) Validated email, name, etc in my user model.
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise) Used Devise at first found it to be a bit more magical and I decided to start over with no Devise.  Much better because I can see how the custom way versus the Devise way.
- [x] Include login (how e.g. Devise) - Custom methods to log in with sessions and users controllers and user model methods - made a sessions controller and view for signing into the app.
- [x] Include logout (how e.g. Devise) - made the destroy method in sessions controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Used OmniAuth-GitHub strategy and followed the lecture from Avi.  Have a better understanding of how it works after over a few days trying to make it work with Devise and then without Devise.
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - made a nested resource for comments with the URL /patterns/10/comments/new.
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - I successfully put in code in my new pattern form to alert the user if the fields are blank. I used css to show these messages in either red or purple.

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
