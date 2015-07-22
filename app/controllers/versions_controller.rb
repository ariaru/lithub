class VersionsController < ApplicationController
  def new
    @version = Version.new
  end

  def create
  end
end