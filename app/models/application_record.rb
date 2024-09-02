class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include UlidGeneratable

  def self.find_or_create_without_not_unique_error!(attrs)
    find_or_create_by!(attrs)
  rescue ActiveRecord::RecordNotUnique
    find_by!(attrs)
  end
end
