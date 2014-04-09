require 'rubinius/actor'
include Rubinius::Actor

pong = nil

ping = Actor.spawn do
  loop do
    count = Actor.receive
    break puts(count) if count > 1000
    pong << (count + 1)
  end
end

pong = Actor.spawn do
  loop do
    count = Actor.receive
    break puts(count) if count > 1000
    ping << (count + 1)
  end
end

ping << 1
sleep 1
