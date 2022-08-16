class UsersController < ApplicationController

    def index
      render "/users/index"
    end

    def show
        @user = User.find(params[:id]) 
        @result = Replist::Client.query Rep::Query, variables: { value:  @user.login  }  
        separat 
    end

    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          redirect_to @user
        else
          render :new
        end
    end

    def user_params
        params.require(:user).permit(:login)
    end


    
    module Rep      
        Query = Replist::Client.parse <<-'GRAPHQL'
        query($value: String!) {
            user (login: $value ){
              name
              repositories(first: 10) {
                nodes{
                  name
                }
            }
          }
        }
        GRAPHQL
    end
    
    def separat
      # start separate Hash 
      @hesh = @result.original_hash              
      separate_data = @hesh["data"]      
      separate_user = separate_data["user"]     
      if separate_user.nil?
        @get_user = "Invalid login please try again"
        @separat_name = ["name"=>"empty"]
      else 
      @get_user = separate_user["name"]    
      separat_repositories = separate_user["repositories"]
      @separat_name = separat_repositories["nodes"]
      end
      # end separate
    end
    
end
