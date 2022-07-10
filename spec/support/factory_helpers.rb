module Support
  module FactoryHelpers
    def add_image(img_path)
      Rack::Test::UploadedFile.new(Rails.root.join(img_path))
    end
  end
end
