require 'forwardable'
require 'time'

class Talk < SimpleDelegator
  extend Forwardable

  PATH_DATE_REGEX = %r[
    (20\d{2}) # Year
    /
    (\d{2}) # Month
    -
    (\d{2})  # Day
  ]x

  def_delegators :data, :title, :author, :intro, :venue

  def date
    Date.parse(date_parts_from_path)
  end

  def date_parts_from_path
    path.scan(PATH_DATE_REGEX).flatten.join('-')
  end

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
