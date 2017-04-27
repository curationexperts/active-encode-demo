This is a basic Rails application for testing active\_encode and hydra-derivatives during development for
[this story](https://github.com/avalonmediasystem/avalon/issues/1785).

## How to Transcode Files

* [Transcoding with Matterhorn/Opencast](https://github.com/curationexperts/active-encode-demo/blob/master/doc/transcoding_with_matterhorn.md)
* [Transcoding with Amazon Elastic Transcoder](https://github.com/curationexperts/active-encode-demo/blob/master/doc/transcoding_with_amazon.md)

## Output File Service

If you want to set an output file service, edit `config/initializers/active_encode.rb`
and set the `output_file_service` to whatever class you need.
