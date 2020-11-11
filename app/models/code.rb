class Code < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ''
      Code.where('detail LIKE(?)', "%#{search}%")
    else
      Code.all
    end
  end

  def self.old_date
    last_one = Code.order(updated_at: :asc)
    last_one.last
  end
end
