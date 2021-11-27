class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def update

        if @user.update_attributes(current_user_params)
          flash[:notice] = "Cadastro atualizado com sucesso."
        else
          flash[:alert] = "Algo deu errado. Não foi possível alterar o cadastro."
        end
        redirect_to page_path

    end

    private

    def current_user_params
      params.require(:user).permit(:title, :body, :photo)
    end

    def set_user
      @user = current_user
    end
end
