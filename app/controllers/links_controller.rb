class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /links
  # GET /links.json
  def index
    if params[:board_id]
      @board = Board.find(params[:board_id])
      @links = @board.links.order(:position)
    else
      @links = Link.order(:position)
    end

    respond_to do |format|
      # format.html
      format.js
    end
  end

  def sort
    params[:link].each_with_index do |id, index|
      Link.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
    respond_to do |format|
      format.js
    end
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    respond_to do |format|
      if @link.save
        format.html { redirect_to boards_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_link
    @link = Link.find(params[:id])
  end

  private

    def link_params
      params.require(:link).permit(:url, :title, :image, :board_id)
    end

end
