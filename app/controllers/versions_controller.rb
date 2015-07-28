class VersionsController < ApplicationController
  def new
    @version = Version.new
  end

  def create
    @version = Version.new(version_params)

    if @version.save
      flash[:success] = 'Version saved.'
      redirect_to new_version_path
    else
      flash[:danger] = 'Error occurred, version has not been saved.'
      redirect_to new_version_path
    end
  end

  def index
    @versions = Version.all
  end

  def show
  end

  def edit
    @version = Version.find(params[:id])
    @current_version = Version.find(params[:id])
  end

  def update
    @version = Version.new(version_params)
    if @version.save
      flash[:success] = 'Version saved.'
      redirect_to new_version_path
    else
      flash[:danger] = 'Error occurred, version has not been saved.'
      redirect_to new_version_path
    end
  end

  private
    def version_params
      params.require(:version).permit(:summary, :body, :tags, :parent_id)
    end
end