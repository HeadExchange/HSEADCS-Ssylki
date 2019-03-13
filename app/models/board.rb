class Board < ApplicationRecord

  include PgSearch
  multisearchable against: [:title, :description]

  after_save :reindex

  has_many :links
  belongs_to :user

  validates :title, presence: true

  scope :ordered_by_title, -> { reorder(title: :asc) }

  private
  def reindex
    PgSearch::Multisearch.rebuild(Board)
  end

end
