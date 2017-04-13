# Transcoding using Matterhorn / Opencast

## Update

This info is probably out of date because I converted the hydra-derivatives branch to work for the Amazon transcoder instead.  In order to get matterhorn to work, we would need to use something like Hyrax's `LocalFileService` class as the `source_file_service` for hydra-derivatives, and it would probably need to call `File.open` directly before passing the source into `ActiveEncode::Base.create`.

Currently the scope is to get it working for the Amazon transcoder, so Matterhorn is out of scope for the moment.  I'm leaving these instructions behind just for reference.

## Prerequsites

### Run Matterhorn

To use matterhorn for media encoding, you need to have matterhorn running.

You can use [avalon-docker](https://github.com/avalonmediasystem/avalon-docker) to run matterhorn if you don't already have a matterhorn server.

Change directory to your avalon-docker workspace, and then run

```bash
docker-compose up matterhorn
```

and you should be able to launch the web console at `http://localhost:8080/`

### Configuration

In `config/initializers/active_encode.rb`, make sure you have the following code:

```ruby
ActiveEncode::Base.engine_adapter = :matterhorn
Rubyhorn.init
```

Make sure you have correct settings in `config/matterhorn.yml`

```
development:
  url: http://matterhorn_system_account:CHANGE_ME@localhost:8080
```

## How to run an encoding job using hydra-derivatives (which uses active\_encode)

```bash
bin/rails c
```

In your rails console:

```ruby
file = '/Users/valerie/Desktop/DCE_sample_files/sample_data.mp4'
Hydra::Derivatives::ActiveEncodeDerivatives.create(file, outputs: [{}])
```

Note: Your rails console will not return to the prompt until the encoding is complete, so it might sit there for several minutes with no feedback.  Use the matterhorn console to see the current status of the encoding.

## How to run an encoding job using just active\_encode (not hydra-derivatives)

```bash
bin/rails c
```

In your rails console:

```ruby
encode = ActiveEncode::Base.create(File.open("#{Rails.root}/test/fixtures/sample.mp4"))
```
