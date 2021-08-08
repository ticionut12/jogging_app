class UsersController < ApplicationController
    before_action :set_user, only: %i[ show update edit destroy ]

    def show
    end


    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to root_url, notice: "User was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      def edit

      end


      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to root_url, notice: "User was successfully updated." }
            format.json { render :show, status: :ok, location: @user}
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    private

        def set_user
            @user = User.find(params[:id])
        end
    
        
        def user_params
            params.require(:user).permit(:id, :email, :role, :created_at)
        end
end

