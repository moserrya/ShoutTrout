path = File.join(Rails.root, 'config/stripe.yml')
STRIPE_CONFIG = YAML.load(File.read(path))[Rails.env].symbolize_keys

Stripe.api_key    = STRIPE_CONFIG[:api_key]
STRIPE_PUBLIC_KEY = STRIPE_CONFIG[:public_key]
