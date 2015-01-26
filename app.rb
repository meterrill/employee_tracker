require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("pg")



get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employees') do
  employee_name = params.fetch('employee_name')
  @employee = Employee.new({:employee_name => employee_name})
  @employee.save()
  erb(:success)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  employee_name = params.fetch("employee_name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:employee_name => employee_name})
  @employees = Employee.all()
  erb(:index)
end
