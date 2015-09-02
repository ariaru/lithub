class RevisionsController < ApplicationController
  def new
    @revision = Revision.new
    @document = Document.find(params[:document_id])
    @branch = Branch.find(params[:branch_id])
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
    @branch = Branch.find(params[:branch_id])
    @document = Document.find(params[:document_id])
    @revisions = Revision.where(document_id: @document)
  end

  def show
    @branch = Branch.find(params[:branch_id])
    @document = Document.find(params[:document_id])
    @current_revision = Revision.find(params[:id])
  end

  def edit
    @branch = Branch.find(params[:branch_id])
    @document = Document.find(params[:document_id])
    @revision = Revision.find(params[:id])
    @current_revision = Revision.find(params[:id])
  end

  def update
    @revision = Revision.new(revision_params)
    @revision.status = "draft" if save_as_draft?
    @revision.status = "publish" if save_as_publish?
    @revision.document_id = params[:document_id] # Why does revision_params not
    # cover this line?
    
    if @revision.status == "publish" && @revision.save
      flash[:success] = 'Revision published!'
    elsif @revision.save
      flash[:success] = 'Revision saved as draft.'
    else
      flash[:danger] = 'Error occurred, revision has not been saved.'
      @revision = Revision.find(params[:id])
      @revision.update(revision_params)
    end

    redirect_to edit_branch_document_revision_path(params[:branch_id], params[:document_id], @revision.id)
  end

  private
    def set_revision
      @revision = Revision.find(params[:id])
      @document = Document.find(params[:document_id])
      @branch = Branch.find(params[:branch_id])
    end

    def revision_params
      params.require(:revision).permit(:root, :parent_id, :summary, :body, :tags, :commit_message, :status, :document_id)
    end

    def save_as_draft?
      params[:commit] == "Save as draft"
    end

    def save_as_publish?
      params[:commit] == "Publish"
    end
end