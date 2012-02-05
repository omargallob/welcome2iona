CarrierWave.configure do |config|
  config.fog_credentials = {
     :provider               => 'AWS',       # required
     :aws_access_key_id      => 'AKIAI7DG2I3UGHEC6FKA',       # required
     :aws_secret_access_key  => '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',       # required
    
   }
  config.fog_directory  = 'isleofiona-development'                     # required
   # 
   #  config.permissions = 0777
   #  config.storage = :s3
   # 
   # 
   #  config.s3_access_key_id = "AKIAI7DG2I3UGHEC6FKA"
   #  config.s3_secret_access_key = "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"
   #  config.s3_bucket = "isleofiona-development"
end
