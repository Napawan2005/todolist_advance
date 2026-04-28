class Todo < ApplicationRecord
  belongs_to :user
  # belongs_to :user => กำหนดความสัมพันธ์ระหว่างโมเดล Todo กับ User โดยที่ Todo จะมีการเชื่อมโยงกับ User ผ่าน user_id ซึ่งเป็น foreign key ในตาราง todos

  enum status: { pending: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :status, presence: true

  scope :upcoming, -> { where(status: [ :pending, :in_progress]).where("due_date > ?", Date.today).order(:due_date) }
  scope :due_soon, -> { upcoming.where("due_date <= ?", 1.day.from_now) }
  scope :reminder_pending, -> { due_soon.where(reminder_sent: false) }#ป้องกันผู้ใส่งให้ผู้ใช้ซ้ำกันหลายคนเด่วมึนส่งคนอื่นไม่ก้ส่งคนเดิมซ้ำกัน

  def overdue?
    due_date.present? && due_date < Date.today && !completed? && !cancelled?
    # due_date.present? => ตรวจสอบว่ามีค่าเดดไลน์ไหม
    # due_date < Date.today => ตรวจสอบว่า due_date น้อยกว่าวันนี้?
    # !completed? => ตรวจสอบว่า status ไม่ใช่ completed
    # !cancelled งานยังไม่ถูกยกเลิก
  end
end
