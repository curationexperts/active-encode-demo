# For transcoding with Matterhorn / Opencast
#ActiveEncode::Base.engine_adapter = :matterhorn
#Rubyhorn.init

# For transcoding with Amazon Elastic Transcoder
ActiveEncode::Base.engine_adapter = :elastic_transcoder

# If you don't want to hook up an output file service:
Hydra::Derivatives::ActiveEncodeDerivatives.output_file_service = NullOutputFileService

