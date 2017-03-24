This is a basic demo application for active_encode. Assuming that
you have the [avalon-docker](https://github.com/avalonmediasystem/avalon-docker) containers up and running you can


```bash
rails c
```

and then

```ruby
encode = ActiveEncode::Base.create(File.open("#{Rails.root}/test/fixtures/sample.mp4"))
```

to get send a file to matterhorn 
