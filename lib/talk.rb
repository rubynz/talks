require 'forwardable'

class Talk < SimpleDelegator
  extend Forwardable

  def_delegators :data, :title, :author, :intro, :venue

  def presented_at
    data.date.strftime('%d %h %Y')
  end

  def timestamp
    data.date.iso8601
  end

  def self.all(resources)
    matching_resources = resources.select do |resource|
      resource.url.start_with?('/talks')
    end

    talks = matching_resources.map do |resource|
      Talk.new(resource)
    end

    talks.sort_by(&:presented_at).reverse
  end
end
