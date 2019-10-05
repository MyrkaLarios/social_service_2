# frozen_string_literal: true

module EmployeesHelper
  def employees
    Employee.all
  end
end
