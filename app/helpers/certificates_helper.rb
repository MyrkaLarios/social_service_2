# frozen_string_literal: true

module CertificatesHelper
  def employees
    Employee.all
  end

  def certificates
    Certificate.kept
  end

  def to_print
    Certificate.kept.where(status: nil)
  end

  def discarded
    Certificate.discarded
  end

  def put_values(body, name, level)
    newb = body.gsub(/#nombre/, name)
    newb = newb.gsub(/#nivel/, level.to_s)
    newb
  end
end
