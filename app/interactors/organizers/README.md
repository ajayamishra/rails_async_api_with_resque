# Organizer

## Rules

- Place the file in `app/interactors/organizers`, don't create hierarchies in the organizers directory.
- Set up transactions if needed.
- Write a test.

## Generate Organizer

  ```bash
  bin/rails generate interactor:organizer organizers/create_user users/build users/save
  ```

### Create Organizer

  ```bash
  bin/rails generate interactor:organizer organizers/create_user users/build users/save
    create  app/interactors/organizers/create_user.rb
    create  spec/interactors/organizers/create_user_spec.rb
  ```

And then, please implement an organizer and some interactors.

  ```rb
  class Organizers::CreateUser
    include Interactor::Organizer

    organize Users::Build, Users::Save
  end
  ```

### Guarantee the transaction

Please add `Interactor::Organizer::Transactional` to an interactor as follows.

  ```rb
  class Organizers::CreateUser
    include Interactor::Organizer
    include Interactor::Organizer::Transactional # Added this code.

    organize Users::Build, Users::Save
  end
  ```

## RubyGems

- [collectiveidea/interactor](https://github.com/collectiveidea/interactor)
- [collectiveidea/interactor-rails](https://github.com/collectiveidea/interactor-rails)
