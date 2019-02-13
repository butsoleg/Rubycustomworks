module Admin
  class EventsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Event.
    #     page(params[:page]).
    #     per(10)
    # end
    

    # Define a custom finder by overriding the `find_resource` method:
    
     def find_resource(param)
       Event.find_by!(code: param)
     end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
