class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_board, only: [:show, :edit, :update, :publish, :destroy]
  # before_action :authorize_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.order('title ASC')
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    redirect_to boards_path
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
  # @board.save

  respond_to do |format|
    if @board.save
      format.html { redirect_to @board, notice: 'Board was successfully updated.' }
      format.json { render :show, status: :ok, location: @board }
    else
      format.html { render :edit }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    def authorize_user
      redirect_to boards_url, notice: "Упс вы не можете управлять этим бордом" if @board.user_id != current_user.id
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :description)
    end
end
