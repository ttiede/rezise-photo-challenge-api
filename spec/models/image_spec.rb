require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Success taking the picture' do
    
    it 'Service find and save picture' do
      photos_urls = ['http://54.152.221.29/images/b737_5.jpg']
      allow(Image).to receive(:exists?).and_return(:false)

      Image.create_from_urls(photos_urls, 'http://localhost:3000').first.should eq('http://54.152.221.29/images/b737_5.jpg')
    end

    it 'Service resize save picture' do
      image = Image.new

      image.file_name = "b777_4.jpg"
      image.source = "http://54.152.221.29/images/b777_5.jpg"

      Image.resizing(image, "http://localhost:3000").should eq({"small"=>{"height"=>320, "width"=>240}, "medium"=>{"height"=>384, "width"=>288}, "large"=>{"height"=>640, "width"=>480}})
    end
  end

  describe 'Raise taking the picture' do
    it 'should raise' do
      expect { Image.create_from_urls(photos_urls, 'http://localhost:3000') }.to raise_error(NameError)
    end
  end

  describe 'Success recovering the pictures' do
    it 'should recovery' do
      photos_urls = ['http://54.152.221.29/images/b737_5.jpg']
      allow(Image).to receive(:exists?).and_return(:false)

      Image.create_from_urls(photos_urls, 'http://localhost:3000').first.should eq('http://54.152.221.29/images/b737_5.jpg')

      Image.all_json_formatted.size.should > 0 
    end
  end
end
