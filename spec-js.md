Specifications for the Rails with jQuery Assessment

Specs:

[x]    Use jQuery for implementing new requirements
        --Rendered an index of patterns via an Ajax request while manipulating the 'List All Patterns' link
        --Rendered a form in Rails and hijacked the 'Create Comment' button to gather the submitted data in JSON and render a list of comments and then manipulated that list to make a 'Next Comment' and 'Previous Comment' action to have the user 'page' through the comments
        --Hijacked the 'Add to Favorites' and 'Delete from Favorites' button to render the response without a page refresh
[x]    Include a show resource rendered using jQuery and an Active Model Serialization JSON       backend.
        --Made my list of comments on the pattern show page to render one at a time by implementing a 'next' and 'previous' link
[x]    Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
        --Took control of the 'List All Patterns' link in the User's show page and made an Ajax request to bring
          data to manipulate to show only the name of each pattern in the DOM while keeping the href for each pattern
          listed.
[x]    Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
        --Made a comment serializer that 'belongs_to :patterns' relationship and a pattern serializer that 'has_many :comments' relationship and rendered comments via JSON and appended those comments to the DOM on the pattern show page
[x]    Use your Rails API and a form to create a resource and render the response without a page refresh.
        --Made a create commens form in the Rails API on the pattern show page
        --Favorite/unfavorite button is a form button on the pattern show page that renders to the pattern show page without refreshing the page
[x]    Translate JSON responses into js model objects.
        --Made a Pattern Serializer file and used the :id and :name attributes and built a Pattern function to include these
          attributes
[x]    At least one of the js model objects must have at least one method added by your code to the prototype.
        --Made a variable 'patternHtml' with a template.
        --Used pattern prototype to format the user's pattern index on the User show page.

Confirm

  [x]  You have a large number of small Git commits
  [x]  Your commit messages are meaningful
        -- I probably need more practice, but I tried to make my comments meaningful.  It was a challenge in that I wanted to continue to code and I would forget to commit more
  [x]  You made the changes in a commit that relate to the commit message
  [x]  You don't include changes in a commit that aren't related to the commit message
