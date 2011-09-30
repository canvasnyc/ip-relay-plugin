require 'net/https'
require 'cgi'
require 'rubygems'
require 'json'

class IPRelay
  # settings is a hash for the iP Relay connection details
  attr_accessor :settings

  def initialize(settings)
    @settings = settings
  end

  # sends the the "payload" as JSON, named as the parameter "contents", to the path "destination"
  def send(destination, contents, payload)
    request = Net::HTTP::Post.new("/#{destination}")
    request.body = "#{contents}=#{CGI.escape(payload.to_json)}"
    uri = URI.parse(@settings[:url])
    if @settings[:basic_auth]
      request.basic_auth(@settings[:username], @settings[:password])
    end
    begin
      response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(request) }
      if response.code == "200"
        puts "iP Relay #{destination} #{contents} successfully sent"
      else
        puts "iP Relay #{destination} #{contents} failure, response code was #{response.code}"
      end
    rescue Exception => e
      puts "iP Relay #{destination} #{contents} failure, exception was #{e}"
    end

    response
  end
end

# include all scripts in /lib
current_path = File.expand_path(File.dirname(__FILE__))
Dir[File.join(current_path, 'lib/*.rb')].each do |file|
  require file
end
