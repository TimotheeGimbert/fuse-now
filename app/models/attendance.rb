class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_to_admin_send

  def confirmation_to_admin_send
    puts self.user
    UserMailer.confirmation_attendance_email(self.user).deliver_now
  end

end
