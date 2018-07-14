class DocumentsController < ApplicationController
  before_action :retrieve_document, only: %i[show edit update destroy]

  def index
    @documents = current_user.documents.order('created_at DESC')
  end

  def new
    @document = current_user.documents.new
  end

  def edit; end

  def create
    @document = current_user.documents.new(document_params)

    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def show; end

  def update
    if @document.update(document_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :content)
  end

  def retrieve_document
    @document = Document.find_by_id(params[:id])
  end
end
