class PredictionState
  attr_accessor :user_id, :prediction_id, :steps_taken, :started_at, :time_to_exist

  def initialize
  end

  def to_h
    {
      user_id: @user_id,
      prediction_id: @prediction_id,
      steps_taken: @steps_taken,
      started_at: @started_at,
      time_to_exist: @time_to_exist
    }
  end

  def save
    client = Aws::DynamoDB::Client.new(region: 'us-west-2')
    resp = client.put_item({
      item: self.to_h,
      table_name: "assertion-prediction-states"
    })
  end

  class << self
    def fetch(user_id, prediction_id)
      client = Aws::DynamoDB::Client.new
      resp = client.get_item({
        key: {"user_id" => user_id, "prediction_id" => prediction_id},
        table_name: "assertion-prediction-states"
      })

      resp.item ? self.from_h(resp.item) : nil
    end

    def from_h(hash)
      hash = hash.deep_symbolize_keys

      failure = self.new
      failure.user_id = hash[:user_id]
      failure.prediction_id = hash[:prediction_id]
      failure.steps_taken = hash[:steps_taken]
      failure.started_at = hash[:started_at]
      failure.time_to_exist = hash[:time_to_exist]
      failure
    end
  end


end
