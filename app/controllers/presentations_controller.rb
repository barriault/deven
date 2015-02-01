class PresentationsController < ApplicationController
  before_action :set_activity, only: [:index, :new,]
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  
  # def index
  #   @presentations = @activity.presentations
  #
  #   respond_to do |format|
  #     format.pdf { send_data Presentations.new(@activity).to_pdf, filename: "Budget - #{@activity.job_number}.pdf", type: "application/pdf" }
  #   end
  # end
  
  # GET /presentations/:id(.:format)
  def show
  end

  # GET /presentations/new(.:format)
  def new
    @presentation = @activity.presentations.new()
  end

  # GET /presentations/:id/edit(.:format)
  def edit
    @activity = @presentation.activity
  end
  
  # POST /presentations(.:format)
  def create
    @presentation = Presentation.new(presentation_params)
    @activity = @presentation.activity

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to activity_path(@activity), notice: 'Record was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  # PATCH/PUT /presentations/:id(.:format)
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to activity_path(@presentation.activity), notice: 'Record was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  # DELETE /presentations/:id(.:format)
  def destroy
    activity = @presentation.activity
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to activity_path(activity), notice: 'Record was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def set_presentation
      @presentation = Presentation.find(params[:id])
      authorize! self.action_name.to_sym, @presentation
    end

    def presentation_params
      params.require(:presentation).permit(
        :activity_id,
        :chronic_event_date,
        :rn_participants,
        :all_participants
      )
    end
end