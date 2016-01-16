class WorkTime < ActiveRecord::Base
  belongs_to :user
  validates :note, length: { maximum: 100 }

  enum holiday_enum: { "" => 0, "欠勤" => 1, "慶弔" => 2, "有給" => 3, "代休" => 4, "その他" => 5 }
  enum late_enum:    { "指定なし_遅刻" => 0, "遅刻" => 1 }
  enum leave_enum:   { "指定なし_早退" => 0, "早退" => 1 }
end
