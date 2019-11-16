class Event < ApplicationRecord
  after_create :new_event_send

  belongs_to :host, class_name: "User", required: false
  has_many :attendances
  has_many :users, through: :attendances

  validates_length_of :description, :in => 5..500, :allow_nil => false
  validates_length_of :title, :in => 5..140, :allow_nil => false
  validates :attendees_max, 
    presence: true,
    inclusion: { in: 3..10, message: "Le numéro de participants doit être compris entre 3 et 10"}

  def new_event_send
    EventMailer.new_event(self).deliver_now
  end

  def event_duration
    @event = self
    @duration = (Time.now.to_i - @event.created_at.to_i)
      if @duration > 3600
        return "#{@duration/3600} heures"
      else
        return "#{@duration/60} minutes"
      end
  end

  def host_age
    @user = self.host
    @age = ((Time.now.to_i - @user.birthday.to_i) / 1.year.seconds).floor
    return @age
  end

end
