# frozen_string_literal: true

class CertificateTemplatesController < ApplicationController
  def index
    @templates = CertificatePart.all
  end

  def new
    @template = CertificatePart.new
  end

  def create
    @template = CertificatePart.create(certificate_parts_params)
    return unless @template.persisted?

    flash[:success] = 'Plantilla creada con éxito'
    redirect_to certificate_templates_path
  end

  def show
    @template = CertificatePart.find(params[:id])
  end

  def edit
    @template = CertificatePart.find(params[:id])
  end

  def destroy
    @template = CertificatePart.find(params[:id])
    @template.destroy
    redirect_to certificate_templates_path, notice: 'Se eliminó correctamente la plantilla'
  end

  private

  def certificate_parts_params
    params.require(:certificate_part).permit(:header, :body, :footer, :name)
  end
end
