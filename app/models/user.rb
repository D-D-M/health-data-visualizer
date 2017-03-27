# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age        :integer
#  gender     :string
#  height     :float
#  weight     :float
#  name       :string
#  country_id :integer
#

class User < ApplicationRecord

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :with_country_id,
      :gender,
    ]
  )

  self.per_page = 10

  belongs_to :country

  scope :gender, lambda { |gender|
    where(gender: gender)
  }

  scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("users.created_at #{ direction }")
    when /^name_/
      order("LOWER(users.last_name) #{ direction }, LOWER(users.first_name) #{ direction }")
    when /^country_name_/
      order("LOWER(countries.name) #{ direction }").includes(:country)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :with_country_id, lambda { |country_ids|
    where(country_id: [*country_ids])
  }

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end

  def self.options_for_gender
    [['Male', 'M'], ['Female', 'F']]
  end

  # def self.options_for_sorted_by
  #   [
  #     ['Name (a-z)', 'name_asc'],
  #   ]
  # end

  # scope :with_created_at_gte, lambda do |ref_date|
  #   where('users.
  # end
end
