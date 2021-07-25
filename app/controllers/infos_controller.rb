class InfosController < ApplicationController
  before_action :set_info, only: %i[ show edit update destroy ]
  # after_action :validates_confirm_password?, only: %i[edit update create]
  # GET /infos or /infos.json
  def index
    @infos = current_user.infos
  end

  # GET /infos/1 or /infos/1.json
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos or /infos.json
  def create
    @info = Info.new(info_params)
    @info.user_id = current_user.id
    if info_params['password'] == info_params['confirm_password']
      respond_to do |format|
        if @info.save
          format.html { redirect_to @info, notice: "Info was successfully created." }
          format.json { render :show, status: :created, location: @info }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_info_path
      flash[:notice] = 'Mismatch Confirm Password'
    end
  end

  # PATCH/PUT /infos/1 or /infos/1.json
  def update
  
    if info_params['password'] == info_params['confirm_password']
      respond_to do |format|
        if @info.update(info_params)
          format.html { redirect_to @info, notice: "Info was successfully updated." }
          format.json { render :show, status: :ok, location: @info }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to  edit_info_path(@info)
      flash[:notice] = 'Mismatch Confirm Password'
   end  
  end

  # DELETE /infos/1 or /infos/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: "Info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # def validates_confirm_password?
    
    
  #   return if info_params['password'] == info_params['confirm_password']
  # end
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def info_params
      params.require(:info).permit(:user_name, :email, :website_name, :password, :confirm_password)
    end
end
