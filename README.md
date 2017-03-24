This is a basic demo application for active_encode. Assuming that
you have the [avalon-docker](https://github.com/avalonmediasystem/avalon-docker) containers up and running you can run:


```bash
rails c
```

and then:

```ruby
encode = ActiveEncode::Base.create(File.open("#{Rails.root}/test/fixtures/sample.mp4"))
```

to send a file to matterhorn 


