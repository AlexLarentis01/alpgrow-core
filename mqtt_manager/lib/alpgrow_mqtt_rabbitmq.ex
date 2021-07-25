defmodule AlpgrowMqttRabbitmq do
  @moduledoc """
  Documentation for `AlpgrowMqttRabbitmq`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AlpgrowMqttRabbitmq.hello()
      :world

  """
  def start do
    {:ok, connection} = AMQP.Connection.open
    {:ok, channel} = AMQP.Channel.open(connection)

    AMQP.Exchange.declare(channel, "mqtt", :topic)

    {:ok, %{queue: queue_name}} = AMQP.Queue.declare(channel, "", exclusive: true)


    AMQP.Queue.bind(channel, queue_name, "mqtt")


    AMQP.Basic.consume(channel, queue_name, nil, no_ack: true)

    IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"

    AlpgrowMqttRabbitmq.ReceiveLogsTopic.wait_for_messages(channel)
  end
end
