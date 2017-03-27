# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  has_many :users, dependent: :nullify

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
