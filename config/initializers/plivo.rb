path = File.join(Rails.root, 'config/plivo.yml')
PLIVO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => '', 'from' => '', 'token' => ''}
