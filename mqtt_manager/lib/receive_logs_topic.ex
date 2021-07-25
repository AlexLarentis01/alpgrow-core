defmodule AlpgrowMqttRabbitmq.ReceiveLogsTopic do
  alias AlpgrowMqttRabbitmq

  @spec wait_for_messages(any) :: no_return
  def wait_for_messages(channel) do
    receive do
      {:basic_deliver, payload, meta} ->
      IO.puts " [x] Received [#{meta.routing_key}] #{payload}"

      wait_for_messages(channel)
    end
  end
end
