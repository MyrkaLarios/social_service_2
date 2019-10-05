# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[edit update destroy]

  def index; end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: 'Empleado guardado con éxito'
    else
      render 'new'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def employee_params
    params.require(:employee).permit(:name, :area, :position, :signing)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
