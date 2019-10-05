# frozen_string_literal: true

class CertificatesController < ApplicationController
  before_action :set_certificate, only: %i[edit update show destroy]

  def index
    @certificates = Certificate.all
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to certificate_path(@certificate.id)
    else
      render 'new', notice: @certificate.errors.full_messages.join(',')
    end
  end

  def edit; end

  def update
    if @certificate.update(certificate_params)
      redirect_to certificates_path
    else
      render 'edit'
    end
  end

  def show
    @template = CertificatePart.find(@certificate.certificate_parts_id)
    @exam = Exam.find(@certificate.exam_id)
    @student = Student.joins(:exams).where('exams.id = ?', @certificate.exam_id)
    @employees = @certificate.employees
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.discard
    flash[:success] = 'Certificado archivado con éxito'
    redirect_to certificates_path
  end

  def print
    @certificate = Certificate.find(params[:id])
    @certificate.update_attribute(:status, true)
    @exam = Exam.find(@certificate.exam_id)
    @student = Student.joins(:exams).where('exams.id = ?', @certificate.exam_id)
    @template = CertificatePart.find(@certificate.certificate_parts_id)
    @employees = @certificate.employees

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "English certificate: #{@student[0]['name']}",
               page_size: 'A4',
               template: 'certificates/_certificate.html.erb',
               layout: 'pdf.html.erb',
               encoding: 'UTF-8',
               orientation: 'Landscape',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  def discard_printed
    certificates = Certificate.where(status: true)
    certificates.each do |cert|
      cert.discard if cert.status
    end
    redirect_to certificates_path, notice: 'Se archivaron las constancias impresas'
  end

  private

  def certificate_params
    params.require(:certificate).permit(:date, :exam_id, :certificate_parts_id, :status, employee_ids: [])
  end

  def set_certificate
    @certificate = Certificate.find(params[:id])
  end
end
