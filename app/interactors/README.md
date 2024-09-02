# Interactors

## Rules

- Place the file in `app/interactors`.
- Have only a single responsibility.
- Determine predictable business logic from class names.
- Make rollback possible.
- Independent of other Interactors.
- Write a test.

## Generate Interactor

  ```bash
  bin/rails generate interactor users/build
  ```

### Create Interactor

  ```bash
  bin/rails generate interactor users/build
    create  app/interactors/users/build.rb
    create  spec/interactors/users/build_spec.rb
  ```

And then, please implement an interactor.

  ```rb
  class Users::Build
    include Interactor

    def call
      # Implement logic
    end
  end
  ```

## RubyGems

- [collectiveidea/interactor](https://github.com/collectiveidea/interactor)
- [collectiveidea/interactor-rails](https://github.com/collectiveidea/interactor-rails)
