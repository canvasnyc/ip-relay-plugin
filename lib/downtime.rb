class IPRelay::Downtime < IPRelay

  # ip_relay = IPRelay::Downtime.new({
  #   :url => 'http://ip-relay.foo.com',
  #   :basic_auth => true,
  #   :username => 'bar',
  #   :password => 'swordfish'
  # })
  #
  # ip_relay.alert({
  #   :url => 'http://foo.bar.com/',
  #   :id => 'foo_bar',
  #   :site => 'Foo Bar Site',
  #   :commands => '[chat:shenanigans]',
  #   :environment => :production,
  #   'message' => 'Timed out in 60s'
  #  })

  def alert(options = {})
    payload = options
    self.send('downtime', 'alert', payload)
  end

end
