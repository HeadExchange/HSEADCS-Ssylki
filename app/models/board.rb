class Board < ApplicationRecord

  acts_as_url :title

  include PgSearch
  multisearchable against: [:title, :description]

  after_save :reindex

  belongs_to :user

  has_many :links
  
  has_many :collaborations
  has_many :collaborative_boards, class_name: "User", through: :collaborations

  validates :title, presence: true
  validates :url, uniqueness: true

  scope :published, -> { where(published: true) }
  scope :my, -> { where(published: false) }
  scope :favourited, -> { where(favourited: true) }
  scope :ordered_by_title, -> { reorder(title: :asc) }

  def to_param
    id.to_s + "-" + url
  end

  private
  def reindex
    PgSearch::Multisearch.rebuild(Board)
  end

end
