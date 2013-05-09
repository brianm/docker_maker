#!/usr/bin/env ruby
# $:.unshift "../lib"

require "docker/maker"

Docker.make(from: "ubuntu:12.10", to: "brianm/buildy") do |b|
  b.maintainer "Brian McCallister <brianm@skife.org>"
  b.env "DEBIAN_FRONTEND" => "noninteractive",
        "USER" => "xncore",
        "PORT" => "8000"

  b.bash <<-EOS
    apt-get update
    apt-get install -y python python-pip
    pip install honcho
  EOS

  b.put "Procfile" => "/Procfile"
  b.cmd ["/bin/bash", "-c", "honcho start"]
  b.expose "8000"
end

