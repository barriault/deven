class Presentation < ActiveRecord::Base
  belongs_to :activity
  
  validates :event_date, :rn_participants, :all_participants, presence: true
  validates :rn_participants, :all_participants, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate  :validate_dates
  
  def chronic_event_date
    event_date.strftime("%m/%d/%Y") if event_date
  end
  def chronic_event_date=(str)
    self.event_date = Chronic.parse(str)
    unless str.blank?
      @event_date_invalid = true if self.event_date.nil?
    end
  end

  private
  
  def validate_dates
    errors.add(:event_date, "is invalid") if @event_date_invalid
  end
end
