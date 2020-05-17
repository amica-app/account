# defmodule TestWorker do
#   use Toniq.Worker # , max_concurrency: 2

#   def perform(name: name) do
#     # do work
#     IO.puts "i am going to call the api to create an xmpp account #{name}"
#   end
# end