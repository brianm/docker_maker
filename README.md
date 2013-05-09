# DockerBuilder

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'docker_builder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker_builder

## Usage

```ruby
#!/usr/bin/env ruby
require "docker/maker"

Docker.build(from: "ubuntu:12.10", to: "brianm/buildy") do |b|
  b.maintainer "Brian McCallister <brianm@skife.org>"
  b.env "DEBIAN_FRONTEND" => "noninteractive",
        "USER" => "xncore"

  b.bash <<-EOS
    apt-get update  
    apt-get install -y netcat python python-pip
    pip install honcho
  EOS

  b.put "./Procfile" => "/Procfile",
        "./app/" => "/var/app"
  b.cmd ["/bin/bash", "-c", "honcho start"]
  b.expose "8000"

end
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
