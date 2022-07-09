class Admins::GunresController < ApplicationController
  def index
    @gunre = Gunre.new
    @gunres = Gunre.all
  end

  def create
    @gunre = Gunre.new(gunre_params)
    @gunre.save
    redirect_to admins_gunres_path
  end
  
  def destroy
    gunre = Gunre.find(params[:id])
    gunre.destroy
    redirect_to admins_gunres_path
  end
end

private

def gunre_params
  params.require(:gunre).permit(:name)
end
