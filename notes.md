What do I need for this app? Which is a knitting pattern app:

#Models
  User- username
  Pattern- user_id, name, content
  Needle- us_size, name
  Yarn- name, weight
  FavoritePattern- pattern_id, user_id
  Comments- content

#Controllers
  UsersController
  PatternsController
  NeedlesController
  YarnsController

#Views
  Users- show, index, new, edit
  Patterns- index, show, new, edit, destroy
  Yarns- index Needles- index

What is my goal for this app?
  WELCOME PAGE
    --welcomes the user and has them either sign up or sign in.
    --Will welcome the user with their welcome and email.
    --will have a sign out link when the user is signed in (all pages)
    --has a favorite project of the day. --has a link to the users profile/projects.
    --has a link to a list of all projects available.
    --has a link to a page to add a pattern with directions, needles and yarn

    ADD PATTERN PAGE
    EDIT PATTERN PAGE
    PATTERN INDEX PAGE
    CURRENT USER PROFILE/PATTERN PAGE
