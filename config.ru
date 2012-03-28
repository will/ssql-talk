require "showoff"
require "altum"
require 'rack/google-analytics'

class ShowOff
  def preshow_files
    Dir.glob("#{options.pres_dir}/_preshow/*").map { |path| File.basename(path) }.sort_by { rand }.to_json
  end
end

if ENV['PUSHER_URL']
  use Altum, :pusher_url => ENV['PUSHER_URL'], :key => ENV['password']
end

use Rack::GoogleAnalytics, :tracker => ENV['GA_CODE']

run ShowOff.new
