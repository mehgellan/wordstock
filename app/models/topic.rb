class Topic < ApplicationRecord
  belongs_to :user
  has_many :words, :dependent => :destroy
end
