class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    @branch.documents.build
    @branch.documents.each { |d| d.revisions.build }
  end

  # GET /branches/1/edit
  def edit
    @branch = Branch.find(params[:id])
    @documents = @branch.documents
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def branch_off
    @old_branch = Branch.find(params[:branch_id])
    @branch = Branch.new
    @branch.name = "Off-#{@old_branch.name}"
    @branch.save

    # @branch.documents = []

    @old_documents = Document.where(branch_id: @old_branch)

    @old_documents.each do |doc|
      new_doc = Document.new
      new_doc.title = doc.title
      new_doc.branch_id = @branch.id
      new_doc.save

      new_first_rev = doc.revisions.last.dup
      new_first_rev.parent_id = doc.revisions.last.id
      new_first_rev.document_id = new_doc.id
      new_first_rev.save
    end
    
    redirect_to edit_branch_path(@branch)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
      # @document = Document.find(params[:document_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :id, documents_attributes: [:id, :title, revisions_attributes: [:root, :parent_id, :summary, :body, :tags, :commit_message, :status, :document_id]])
    end
end
