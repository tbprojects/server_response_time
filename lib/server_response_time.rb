class ServerResponseTime
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :date, :user, :url, :remote, :response_time

  DEFAULT_PARAMS = { :date => Time.now.to_s(:db),
                     :user => "",
                     :url => "",
                     :remote => false,
                     :response_time => 0 }

  LOG_FILE = "#{Rails.root.to_s}/log/response_time.log"
  LOG_SEPARATOR = "----"

  def initialize(options = {})
    set_params(DEFAULT_PARAMS)
    set_params(options)
  end

  def self.create(options = {})
    result = new(options)
    result.save
  end

  def save
    File.open(LOG_FILE, 'a') {|f| f.write("#{LOG_SEPARATOR}\n#{self.to_json}\n") }
  end

  def set_params(options)
    DEFAULT_PARAMS.keys.each{|param| self.send("#{param}=", options[param.to_sym]) unless options[param.to_sym].nil?}
  end

  def self.latest(n = 1)
    log = `tail -n#{n*2} #{LOG_FILE}`
    parse_logs(log)
  end

  def self.all
    log = `cat #{LOG_FILE}`
    parse_logs(log)
  end

  private
  def self.parse_logs(log)
    log.split(LOG_SEPARATOR).map{|txt|JSON.parse(txt) rescue nil}.compact.map{|hash| ServerResponseTime.new(hash.symbolize_keys)}
  end

end