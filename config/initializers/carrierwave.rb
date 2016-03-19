CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJDEGFGK34NS3S5GQ',
      :aws_secret_access_key  => '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',
      :region                 => 'ap-southeast-1'
  }
  config.fog_directory  = 'bitdeets'
end