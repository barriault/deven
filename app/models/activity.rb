class Activity < ActiveRecord::Base
  
  monetize :commercial_support_cents, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  monetize :sponsorship_cents, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  
  validates :title, :start_date, :end_date, :activity_type, :contact_hours, presence: true
  validates :contact_hours, numericality: { greater_than: 0 }
  validate  :validate_dates
  
  def chronic_start_date
    start_date.strftime("%m/%d/%Y") if start_date
  end
  def chronic_start_date=(str)
    self.start_date = Chronic.parse(str)
    unless str.blank?
      @start_date_invalid = true if self.start_date.nil?
    end
  end
  
  def chronic_end_date
    end_date.strftime("%m/%d/%Y") if end_date
  end
  def chronic_end_date=(str)
    self.end_date = Chronic.parse(str)
    unless str.blank?
      @end_date_invalid = true if self.end_date.nil?
    end
  end
  
  ACTIVITY_TYPES = [
    [ "PD", "PD" ], 
    [ "LP", "LP" ]
  ]
  
  private
  
  def validate_dates
    errors.add(:start_date, "is invalid") if @start_date_invalid
    errors.add(:end_date, "is invalid") if @end_date_invalid
  end
end
