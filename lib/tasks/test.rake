desc 'Run minitest'
task :test do
  # Dir.glob('./test/*_test.rb').each { |file| require file }
  require 'minitest/autorun'
end
