class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :description, length: { maximum: 5000 }, allow_blank: true
  validates :status, inclusion: { in: %w(open in_progress closed), message: "%{value} is not a valid status" }, allow_blank: true
  validates :priority, inclusion: { in: %w(low medium high urgent), message: "%{value} is not a valid priority" }, allow_blank: true

  # Search and filter
  # Use case-insensitive search compatible with SQLite and Postgres.
  scope :search, ->(query) {
    if query.present?
      q = "%#{query.downcase}%"
      where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", q, q)
    end
  }
  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_priority, ->(priority) { where(priority: priority) if priority.present? }
  scope :by_creator, ->(creator) { where(created_by: creator) if creator.present? }

  before_save :set_default_values

  private

  def set_default_values
    self.status ||= 'open'
    self.priority ||= 'medium'
  end
end
