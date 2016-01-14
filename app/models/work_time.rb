class WorkTime < ActiveRecord::Base
  belongs_to :user
  validates :note, length: { maximum: 100 }

  enum holiday_enum: { "" => 0, "欠勤" => 1, "慶弔" => 2, "有給" => 3, "代休" => 4, "その他" => 5 }
end
