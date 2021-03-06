require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:book) { create(:book) }
  describe "GET /books" do
    it "returns http success" do
      get "/books"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /book/:id" do
    it "returns http success" do
      get "/books/#{book.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/books/#{book.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/books/#{book.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/books/#{book.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
