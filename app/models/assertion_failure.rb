class AssertionFailure
  attr_accessor :id, :failed_at, :assertion_name, :user_id

  def initialize
  end

  def to_h
    {
      id: @id,
      failed_at: DateTime.iso8601(@failed_at).in_time_zone('UTC').iso8601,
      assertion_name: @assertion_name,
      user_id: @user_id
    }
  end

  def save
    client = Aws::DynamoDB::Client.new(region: 'us-west-2')
    resp = client.put_item({
      item: self.to_h,
      table_name: "assertion-failures"
    })
  end

  class << self
    def from_h(hash)
      hash = hash.deep_symbolize_keys

      failure = self.new
      failure.id = hash[:id]
      failure.failed_at = hash[:failed_at]
      failure.assertion_name = hash[:assertion_name]
      failure.user_id = hash[:user_id]
      failure
    end
  end
end
