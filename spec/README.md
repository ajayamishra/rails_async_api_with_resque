# RSpec testing

## Creation of the test data

You can create test data using [FactoryBot](https://github.com/thoughtbot/factory_bot) easily.

Create the test data as follows[^1]

```rb
# Returns a User instance that's not saved
let(:user) { build(:user) }

# Returns a saved User instance
let(:user) { create(:user) }

# Returns an object with all defined attributes stubbed out
let(:stub) { build_stubbed(:user) }
```

[^1]: https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#using-factories

## When writing fixed-time tests

Please use ActiveSupport::Testing::TimeHelpers[^2]

Use the helper as follows

```rb
# Declare a block of code, we can freeze the time before the test runs and melt it after.
around { |e| travel_to(Time.current) { e.run } }

# Can declare it block as follows.
it do
  travel_to(Time.current.yesterday) do
    # Test something
  end
end

# Examples:
it do
  current = Time.zone.now
  travel_to(current.tomorrow) do
    puts Time.zone.now
  end
  puts "Welcome to the future!"
  # Back to current
  travel_to(current) do
    puts Time.zone.now
  end
end
# 2023-03-11 15:18:19 +0900
# Welcome to the future!
# 2023-03-10 15:18:19 +0900
```

[^2]: https://api.rubyonrails.org/classes/ActiveSupport/Testing/TimeHelpers.html

## Shoulda Matchers

[Please refer to the library for usage](https://github.com/thoughtbot/shoulda-matchers#usage)
