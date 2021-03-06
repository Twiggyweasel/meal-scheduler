# frozen_string_literal: true

# == Schema Information
#
# Table name: cuisines
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Cuisine < ApplicationRecord
  enum status: %i[active inactive pending_approval]
  # validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 15 }
  validates :status, presence: true
end
