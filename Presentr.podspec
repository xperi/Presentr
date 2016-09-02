Pod::Spec.new do |s|
  s.name         = "Presentr"
  s.version      = "0.1.9"
  s.summary      = "A simple Swift wrapper for typical custom view controller presentations."
  s.description  = <<-DESC
                    A micro framework created in Swift. Simplifies creating custom view controller presentations. Specially the typical ones we use which are a popup, an alert, or a any non-full-screen modal. Abstracts having to deal with custom presentation controllers and transitioning delegates
                   DESC
  s.homepage     = "http://github.com/xperi/Presentr"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Daniel Lozano" => "dan@danielozano.com" }
  s.social_media_url   = "http://twitter.com/danlozanov"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xperi/Presentr.git", :tag => "0.1.9" }
  s.source_files = "Presentr/**/*.{swift}"
  s.resources    = "Presentr/**/*.{xib,ttf}"
end
