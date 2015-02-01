class Program < ActiveRecord::Base
  
  validates :name, presence: true
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
  
  private
  
  def validate_dates
    errors.add(:start_date, "is invalid") if @start_date_invalid
    errors.add(:end_date, "is invalid") if @end_date_invalid
  end
end
