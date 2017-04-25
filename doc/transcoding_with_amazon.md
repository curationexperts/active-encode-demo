# Transcoding using Amazon Elastic Transcoder

## How to run an encoding job using hydra-derivatives (which uses active\_encode)

You'll need to have fedora running on port `8984`.

This information has moved to the [hydra-derivatives codebase](https://github.com/projecthydra/hydra-derivatives).
Look under the `doc` directory.  Currently the document is on the `active_encode_dev_con` branch, but later it will probably be merged into `master` branch.

## How to run an encoding job using just active\_encode (not hydra-derivatives)

In your rails console:

```ruby
# Access config for AWS
Aws.config[:access_key_id] = 'put your access key here'
Aws.config[:secret_access_key] = 'put your secret key here'
Aws.config[:region] = 'us-east-1'

# The pipeline that I set up in Elastic Transcoder
pipeline_id = '1490715200916-25b08y'

# The file "sample_data.mp4" has already been uploaded to the input bucket for my pipeline.
input_file = 'sample_data.mp4'

# For the type of output file to create, I chose the preset for a 320x240 resolution mp4 file.
preset_id = "1351620000001-000061"

# Choose a name for the output file
output_file = 'output_2.mp4'

# Start encoding the file
encode = ActiveEncode::Base.create(input_file, pipeline_id: pipeline_id, output_key_prefix: "active_encode-demo_app/", outputs: [{ key: output_file, preset_id: preset_id }])

# Check the status of the encoding
encode.reload.running?
encode.reload.state
```

