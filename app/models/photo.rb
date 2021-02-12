class Photo < ApplicationRecord
  enum effect: [ :nothing, :colorizer, :'torch-srgan', :toonify, :deepdream, :waifu2x, :remove_bg, :blur, :blur_bg ]
end
