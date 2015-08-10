class RevisionsController < ApplicationController
  def new
    @revision = Revision.new
  end

  def create
    @revision = Revision.new(revision_params)

    if @revision.save
      flash[:success] = 'Revision saved.'
      redirect_to new_revision_path
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
    if @revision.save
      flash[:success] = 'Revision saved.'
      redirect_to new_revision_path
    else
      flash[:danger] = 'Error occurred, revision has not been saved.'
      redirect_to new_revision_path
    end
  end

  private
    def revision_params
      params.require(:revision).permit(:summary, :body, :tags, :parent_id, :commit_message)
    end

    def save_as_draft?
      params[:commit] == "Save as draft"
    end

    def save_new_revision?
      params[:commit] == "Save new revision"
    end
end