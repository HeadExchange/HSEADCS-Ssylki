class BoardsController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!
  before_action :set_board, only: [:index, :show, :edit, :update, :publish, :destroy]
  load_and_authorize_resource

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.order('title ASC').page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
    @links = @board.links.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def shared
    @board = Board.find_by_share_url(params[:id])
    @links = @board.links.all

    respond_to do |format|
      format.html { render 'show' }
      format.js
    end
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /boards
  # POST /boards.json
  def create
    # Board.create(slug: to_slug(title))
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
  @board.public = !@board.public

  if @board.share_url == nil || @board.share_url == ""
    @board.share_url = SecureRandom.uuid
  end

  respond_to do |format|
    if @board.save
      format.html { redirect_to board_url(@board), notice: 'Board was successfully updated.' }
      format.json { render :show, status: :ok, location: @board }
      format.js
    else
      format.html { render :new }
      format.json { render json: @board.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authorize_user
    redirect_to boards_url, notice: "Упс вы не можете управлять этим бордом" if @board.user_id != current_user.id
  end

  private

    def set_board
      # if @board.public
      #    @board = Board.find_by_share_url(params[:id]) || @board = Board.find_by_url(params[:id])
      # else
        @board = Board.find_by_url(params[:id])
      # end
    end

    def board_params
      params.require(:board).permit(:title, :description)
    end

end
