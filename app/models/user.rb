class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :keycloak_uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def google_token_valid?
    google_access_token.present? && google_token_expire_at&.future?
  end

  ## google_token_valid => เช็คว่ามีค่าว่างไหม
  ## google_token_expire_at&.future? => เช็คว่าเวลาหมดอายุยังไม่หมดหรือยัง
  ## google_access_token.present? => ตรวจสอบว่า google_access_token มีค่าอยู่หรือไม่

  def display_name
    full_name.presence || email.split("@").first
  end

  ## full_name.presence => ถ้า full_name มีค่าอยู่จะใช้ค่านั้น แต่ถ้าไม่มีค่าจะใช้ 
  ## email.split("@").first ซึ่งจะตัดส่วนที่อยู่ก่อนเครื่องหมาย @ ของอีเมลมาแสดงแทน  

end
