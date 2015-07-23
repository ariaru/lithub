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

  private
    def version_params
      params.require(:version).permit(:summary, :body, :tags)
    end
end