Pod::Spec.new do |s|

  s.name         = "AMPEasyTable"
  s.version      = "0.0.1"
  s.summary      = "UITableView delegate manager based on blocks with static and dynamic heigth calculation"

  s.description  = <<-DESC
                   Implement iOS tables with a few lines.

                   Forget about:
                   * Declare your view controller as delegate or datasource.
                   * Reuse cells.
                   * Calculate your cells heigth.
                   DESC

  s.homepage     = "https://github.com/alvaromurillo/AMPEasyTable"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Álvaro Murillo del Puerto" => "https://github.com/alvaromurillo" }
  s.social_media_url   = "http://twitter.com/alvaromurillop"

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/alvaromurillo/AMPEasyTable.git", :tag => "0.0.1" }
  s.source_files  = "AMPEasyTable", "AMPEasyTable/**/*.{h,m}"

end
