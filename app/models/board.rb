class Board < ApplicationRecord

  acts_as_url :title

  include PgSearch
  multisearchable against: [:title, :description]

  after_save :reindex

  has_many :links
  belongs_to :user

  validates :title, presence: true
  validates :url, uniqueness: true

  def to_param
    id.to_s + "-" + url
  end

  scope :ordered_by_title, -> { reorder(title: :asc) }

  private
  def reindex
    PgSearch::Multisearch.rebuild(Board)
  end

end
