class Board < ApplicationRecord

  acts_as_url :title

  include PgSearch
  multisearchable against: [:title, :description]

  after_save :reindex

  belongs_to :user

  has_many :links
  has_many :collaborations
  has_many :collaborators, class_name: "User", through: :collaborations, source: :users

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
