class Status < ApplicationRecord
  before_validation :downcase_status

  validates :stat, inclusion:  { in: %w(up down), message: '%{value} is an invalid status' }

  # NOTE: Ensure that at least of these properties are present before save.
  validates :stat, presence: true, unless: :message
  validates :message, presence: true, unless: :stat

  default_scope -> { order(created_at: :desc) }
  scope :latest, -> { where.not(message: nil).take(10) }

  class << self
    def current_status
      where.not(stat: nil).pluck(:stat)
    end
  end

  private

  def downcase_status
    self.stat = stat.downcase if stat
  end
end
