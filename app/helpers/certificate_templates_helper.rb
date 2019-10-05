# frozen_string_literal: true

module CertificateTemplatesHelper
  def exams
    Exam.approved
  end

  def templates
    CertificatePart.all
  end
end
