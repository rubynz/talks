require 'forwardable'

class Talk < SimpleDelegator
  extend Forwardable

  def_delegators :data, :title, :author, :intro, :venue

  def presented_at
    date.strftime('%-d %b %Y')
  end

  def timestamp
    date.iso8601
  end

  def upcoming?
    date > Time.now
  end

  def self.all(resources)
    matching_resources = resources.select do |resource|
      resource.path.start_with?('talks')
    end

    talks = matching_resources.map do |resource|
      Talk.new(resource)
    end

    talks.sort_by(&:date).reverse
  end
end
