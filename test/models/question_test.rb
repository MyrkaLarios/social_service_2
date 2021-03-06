# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Question do
  let(:question) { Question.new }

  it "must be valid" do
    value(question).must_be :valid?
  end
end
