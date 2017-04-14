# Transcoding using Amazon Elastic Transcoder

## Prerequsites

### Set up the Elastic Transcoder Pipeline

Set up a pipeline on AWS Elastic Transcoder that defines:

* input bucket
* bucket for transcoded files
* bucket for thumbnails

### Configure AWS credentials

Optional: If you don't want to pass these values in the rails console, you can set environment variables instead:

* AWS\_ACCESS\_KEY\_ID
* AWS\_SECRET\_ACCESS\_KEY
* AWS\_REGION

[The regions are listed here](http://docs.aws.amazon.com/general/latest/gr/rande.html#elastictranscoder_region)

### Configure initializer

In `config/initializers/active_encode.rb`, make sure you have the following code:

```ruby
ActiveEncode::Base.engine_adapter = :elastic_transcoder
```

## How to run an encoding job using hydra-derivatives (which uses active\_encode)

```bash
bin/rails c
```
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
output_file = 'output_7.mp4'

# The options to pass to the Elastic Transcoder job
low_res_video = { pipeline_id: pipeline_id, output_key_prefix: "active_encode-demo_app/", outputs: [{ key: output_file, preset_id: preset_id }] }

Hydra::Derivatives::ActiveEncodeDerivatives.create(input_file, outputs: [low_res_video])
```

Note: Your rails console will not return to the prompt until the encoding is complete, so it might sit there for several minutes with no feedback.  Use the AWS console to see the current status of the encoding.

## How to run an encoding job using just active\_encode (not hydra-derivatives)

```bash
bin/rails c
```
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

