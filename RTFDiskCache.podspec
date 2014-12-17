Pod::Spec.new do |s|
  s.name         = "RTFDiskCache"
  s.version      = "1.0.0"
  s.summary      = "Read/Write Objects to/from disk"
  s.homepage     = "https://github.com/MaxKramer/RTFDiskCache"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Max Kramer" => "max@maxkramer.co" }
  s.social_media_url   = "http://twitter.com/MaxKramer"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MaxKramer/RTFDiskCache.git", :tag => "v1.0.0" }
  s.source_files  = "src/*.{h,m}"
  s.requires_arc = true
end
