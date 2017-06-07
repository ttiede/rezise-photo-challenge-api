require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Success taking the picture' do
    it 'Service find and save picture' do
      photos_urls = ['http://54.152.221.29/images/b737_5.jpg']

      Image.create_from_urls(photos_urls, 'http://localhost:3000').first.should eq('http://54.152.221.29/images/b737_5.jpg')
    end

    it 'Service duplicate  save picture' do
      photos_urls = ['http://54.152.221.29/images/b737_5.jpg']

      Image.create_from_urls(photos_urls, 'http://localhost:3000').first.should eq('http://54.152.221.29/images/b737_5.jpg')
    end

    it 'Service empty image' do
      photos_urls = ['']
      Image.create_from_urls(photos_urls, 'http://localhost:3000').first.should eq('')
    end
  end

  describe 'Raise taking the picture' do
    it 'should raise' do
      expect { Image.create_from_urls(photos_urls, 'http://localhost:3000') }.to raise_error(NameError)
    end
  end
end
