class EmployeesController < ApplicationController
    def index
        @employees=Employee.all
    end
    
    def new
        @employee=Employee.new
    end
    
    def create
        @employee=Employee.create(strong_params)

        if @employee.valid?
            redirect_to employee_path(@employee.id)
        else
            flash[:error]=@employee.errors.full_messages
            redirect_to new_employee_path
        end

    end
    
    def edit
        @employee=Employee.find(params[:id])
    end
    
    def update
        @employee=Employee.find(params[:id])
        @employee.update(strong_params)
    end
    
    def show
        @employee=Employee.find(params[:id])
    end
    
    def destroy
    
    end

    private

    def strong_params
        params.require(:employee).permit(:first_name,:last_name,:alias,:title,:office,:url,:dog_id)
    end
end
