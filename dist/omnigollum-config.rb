Gollum::Page.send :remove_const, :FORMAT_NAMES if defined? Gollum::Page::FORMAT_NAMES
Gollum::Page::FORMAT_NAMES = { :markdown  => "Markdown" }

config_path = File.expand_path(File.dirname(__FILE__))
gollum_path = "#{config_path}/repos"
Precious::App.set(:gollum_path, gollum_path)

# wiki configuration

wiki_options = {
  :live_preview => true,
  :no_live_preview => false,
  :allow_uploads => true,
  :allow_editing => true,
  :h1_title => false,
  :js => true,
  :css => true
}

Precious::App.set(:wiki_options, wiki_options)
Precious::App.set(:environment, :production)

# omniauth configuration
require 'omnigollum'

# oauth-github configuration
# if enabled, you must install 'omniauth-github'
=begin
github_oauth = {
  :client_id => 'GITHUB_CLIENT_ID',
  :client_secret => 'GITHUB_CLIENT_SECRET'
}
require 'omniauth/strategies/github'
=end

# omniauth-mastodon configuration
# if enabled, you must install 'omniauth-mastodon', 'mastodon-api'
=begin
require 'mastodon'
require 'omniauth/strategies/mastodon'

require "#{config_path}/mastodon/instances"
=end

options = {
  :providers => Proc.new do
# github provider
=begin
    provider :github, github_oauth[:client_id], github_oauth[:client_secret]
=end

# mastodon provider
=begin
    provider :mastodon, scope: 'read', credentials: lambda { |domain, callback_url|

      existing = Instance.find_by(domain: domain)
      return [existing.client_id, existing.client_secret] unless existing.nil?

      client = Mastodon::REST::Client.new(base_url: "https://#{domain}")
      app = client.create_app('Gollum wiki', callback_url)

      Instance.create!(domain: domain, client_id: app.client_id, client_secret: app.client_secret)

      [app.client_id, app.client_secret]
    }
=end
  end,
  :dummy_auth => false,
  :authorized_users => false,
  :default_name => 'example name',
  :default_email => 'example@example.com',
  :author_format => Proc.new { |user| user.provider == 'mastodon' ? user.uid : user.name },
  :author_email => Proc.new { |user| user.provider == 'mastodon' ? user.uid : user.email }
}

Precious::App.set(:omnigollum, options)
Precious::App.register Omnigollum::Sinatra

