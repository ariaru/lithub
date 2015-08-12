class RevisionsController < ApplicationController
  def new
    @revision = Revision.new
  end

  def create
    @revision = Revision.new(revision_params)

    if @revision.save
      flash[:success] = 'Revision saved.'
      redirect_to edit_revision_path(@revision.id)
    else
      flash[:danger] = 'Error occurred, revision has not been saved.'
      redirect_to new_revision_path
    end
  end

  def index
    @revisions = Revision.all
  end

  def show
  end

  def edit
    @revision = Revision.find(params[:id])
    @current_revision = Revision.find(params[:id])
  end

  def update
    @revision = Revision.new(revision_params)
    @revision.status = "draft" if save_as_draft?
    @revision.status = "publish" if save_new_revision?

    if @revision.save && (@revision.status == "publish")
      # add code here
      flash[:success] = 'Revision published!'
      redirect_to edit_revision_path(@revision.id)
    elsif @revision.save
      flash[:success] = 'Revision saved.'
      redirect_to edit_revision_path(@revision.id)
    else
      flash[:danger] = 'Error occurred, revision has not been saved.'
      redirect_to edit_revision_path(@revision.id)
    end
  end

  private
    def revision_params
      params.require(:revision).permit(:summary, :body, :tags, :parent_id, :commit_message, :status)
    end

    def save_as_draft?
      params[:commit] == "Save as draft"
    end

    def save_new_revision?
      params[:commit] == "Save new revision"
    end
end