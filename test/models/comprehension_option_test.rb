# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_options
#
#  id                        :bigint           not null, primary key
#  content                   :string(255)
#  type                      :integer
#  correct                   :boolean          default(FALSE)
#  comprehension_question_id :bigint
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require "test_helper"

describe ComprehensionOption do

end
