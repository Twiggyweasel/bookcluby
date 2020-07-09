# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string
#  book_cover  :string
#  description :text
#  genre       :string
#  isbn        :string
#  pages       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { create(:book) } 
  
  describe "associations" do
    it { should belong_to(:user) } 
    it { should have_many(:recommendations) } 
  end
  

  describe "validations" do
    it { should validate_presence_of(:title) }  
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:pages) }
    it { should validate_numericality_of(:pages).is_greater_than(49).is_less_than(2001) }
    it { should validate_presence_of(:description) }
  end

end
