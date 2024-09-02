# Controllers

## Examples

  ```rb
  class Api::Private:UsersController < Api::Private::BaseController
    # Call an organizer
    result = Organizers::Users::CreateOrganizer.call(parameter)

    render json: result.serialized
  end
  ```

  ```rb
  class UsersController < ApplicationController
    # Call an interactor
    result = Users::BuildInteractor.call(parameter)

    result.something
  end
  ```

## About serialized

1. Define an entity serializer in `app/serializers/some_entity_serializer.rb`

    Define the class `class SomeEntitySerializer < BaseSerializer` to inherits `BaseSerializer`

    Then, the data will be returned as follows:

    For Object

    ```
    {"data":{}}
    ```

    For Array

    ```
    {"data":[],"meta":{"total_count":0}}
    ```

1. Add `organize Utils::JsonSerializer` to `app/interactors/organizers/some_entity_organizer.rb`

1. Add a spec file with `let(:interactors) { [::Utils::JsonSerializer] }` to `spec/interactors/organizers/some_entity_organizer_spec.rb`

1. Add a model for some entity that can be initialized `app/models/some_entity.rb` from interactor

1. [Optional] If your model is related to active record, you may need create `spec/factories/some_entity.rb` to build dummy data

1. Add `before { context.serializer = SomeEntitySerializer }` to `app/interactors/some_entity/some_process.rb`
