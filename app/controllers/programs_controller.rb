class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.order(name: :asc).page params[:page]
  end
  
  def show
  end

  def new
    @program = Program.new
  end

  def edit
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @program.update(program_params)
      redirect_to @program, notice: 'Program was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_url, notice: 'Program was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:name, :chronic_start_date, :chronic_end_date)
    end
end
