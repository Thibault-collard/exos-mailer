require 'faker'

class EmailsController < ApplicationController

def index
	@emails = Email.all
end

def create
	@email = Email.new(object: Faker::String.random, body: Faker::Lorem.paragraph)
	 if @email.save
	 	flash[:notice] = "Task created"
        respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
      end
       flash[:notice] = "Task created"
     else
       redirect_to root_path
       flash[:notice] = "Please try again"
     end
end
def show
	@email = Email.find(params[:id])
end

def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
end
end

end
