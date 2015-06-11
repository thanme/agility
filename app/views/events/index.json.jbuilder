json.array!(@events) do |event|
  json.extract! event, :id, :hosting_club, :isAgility, :isJumping, :isADO, :isJDO, :isSnooker, :isGamblers, :isStratPairs, :trial_datetime, :notes
  json.url event_url(event, format: :json)
end
