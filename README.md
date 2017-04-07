This is a basic Rails application for testing active\_encode and hydra-derivatives during development for
[this story](https://github.com/avalonmediasystem/avalon/issues/1785).

### Prerequsites

This app uses matterhorn for media encoding, so you need to have matterhorn running.

You can use [avalon-docker](https://github.com/avalonmediasystem/avalon-docker) to run matterhorn if you don't already have a matterhorn server.

Change directory to your avalon-docker workspace, and then run

```bash
docker-compose up matterhorn
```

and you should be able to launch the web console at `http://localhost:8080/`


### How to run an encoding job using hydra-derivatives (which uses active\_encode)

```bash
bin/rails c
```

In your rails console:

```ruby
file = '/Users/valerie/Desktop/DCE_sample_files/sample_data.mp4'
Hydra::Derivatives::ActiveEncodeDerivatives.create(file, outputs: [{}])
```

Note: Your rails console will not return to the prompt until the encoding is complete, so it might sit there for several minutes with no feedback.  Use the matterhorn console to see the current status of the encoding.

### How to run an encoding job using just active\_encode (not hydra-derivatives)

```bash
bin/rails c
```

In your rails console:

```ruby
encode = ActiveEncode::Base.create(File.open("#{Rails.root}/test/fixtures/sample.mp4"))
```
