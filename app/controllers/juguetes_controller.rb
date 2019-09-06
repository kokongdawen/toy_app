class JuguetesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @juguete = current_user.juguetes.build(juguete_params)
    if @juguete.save
      flash[:success] = "Tara laro"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def edit
    @juguete = Juguete.find(params[:id])
  end

  def update
    if params[:juguete][:name].empty?
      @juguete.errors.add(:juguete, "Walang pangalan?")
      render 'edit'
    elsif @juguete.update(juguete_params)
      #log_in @user
      flash[:success] = "Iba naman"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @juguete.destroy
    flash[:success] = "Move on na"
    redirect_to request.referrer || root_url
  end

  private

    def juguete_params
      params.require(:juguete).permit(:name, :content, :price)
    end

    def correct_user
      @juguete = current_user.juguetes.find_by(id: params[:id])
      redirect_to root_url if @juguete.nil?
    end
end
