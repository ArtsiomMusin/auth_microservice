channel = RabbitMq.consumer_channel
exchange = channel.default_exchange
queue = channel.queue('auth', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  Thread.current[:request_id] = properties.headers['request_id']
  payload = JSON(payload)
  result = AuthService.call(payload['token'])
 
  Application.logger.info(
    'client authenticated result',
    result: result
  )

  data = result.user ? {id: result.user.id}.to_json : '' 
  exchange.publish(
    data, 
    routing_key: properties.reply_to,
    correlation_id: properties.correlation_id
  )
end
