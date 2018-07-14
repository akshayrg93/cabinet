class DocumentsController < ApplicationController
  before_action :retrieve_document, only: %i[show edit update destroy]

  def index
    @documents = Document.all.order('created_at DESC')
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def show; end

  private

  def document_params
    params.require(:document).permit(:title, :content)
  end

  def retrieve_document
    @document = Document.find_by_id(params[:id])
  end
end
