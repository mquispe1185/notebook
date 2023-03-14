class Note < ApplicationRecord
  validates :title, :body, :date, presence: { message: "can't be blank" }

  def self.search(search)
    where('title ilike ?', "%#{search}%").or(where('body ilike ?', "%#{search}%"))
  end
end
