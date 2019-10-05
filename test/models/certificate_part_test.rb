# frozen_string_literal: true

# == Schema Information
#
# Table name: certificate_parts
#
#  id         :bigint           not null, primary key
#  header     :string(255)
#  body       :text(65535)
#  footer     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

require "test_helper"

describe CertificatePart do

end
