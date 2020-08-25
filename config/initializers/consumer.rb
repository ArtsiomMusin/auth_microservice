channel = RabbitMq.consumer_channel
exchange = channel.default_exchange
queue = channel.queue('auth', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  result = AuthService.call(payload['token'])
 
  p result

  data = result.user ? {id: result.user.id}.to_json : '' 
  exchange.publish(
    data, 
    routing_key: properties.reply_to,
    correlation_id: properties.correlation_id
  )
end
