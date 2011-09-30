class IPRelay::Deployment < IPRelay

  # to use within Capistrano:
  #
  # ip_relay = IPRelay::Deployment.new({
  #   :url => 'http://ip-relay.foo.com',
  #   :basic_auth => true,
  #   :username => 'bar',
  #   :password => 'swordfish'
  # })
  #
  # ip_relay.notification({
  #   :application => application,
  #   :environment => rails_env,
  #   :branch => revision,
  #   :commit => real_revision,
  #   :commands => '[chat:shenanigans]',
  #   :name => `git config user.name`.strip
  # })

  def notification(options = {})
    payload = options
    payload[:name] = payload[:name] || 'Somebody'
    self.send('deployment', 'notification', payload)
  end

end
