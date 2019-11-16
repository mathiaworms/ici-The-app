class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :event_host, foreign_key: 'host_id', class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances
  has_many :conctact_reports

end
