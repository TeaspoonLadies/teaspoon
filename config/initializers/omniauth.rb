EVERNOTE_CONFIG = YAML.load(File.read("config/application.yml"))

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :evernote, EVERNOTE_CONFIG['EN_CONSUMER_KEY'], EVERNOTE_CONFIG['EN_CONSUMER_SECRET'], :client_options => { :site => 'https://sandbox.evernote.com' }
end