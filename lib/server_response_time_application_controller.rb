module ServerResponseTimeApplicationController

  protected
  def log_start_time
    @r_start_time = Time.now
  end

  def log_end_time
    @r_end_time = Time.now
    time = @r_end_time.to_f - @r_start_time.to_f rescue 0
    ServerResponseTime.create(:date => Time.now.to_s(:db),
                              :user => (current_user ? current_user.username : "not logged"),
                              :url => request.url,
                              :remote => request.xhr?,
                              :response_time => time.round(2)
    ) unless request.url.include?("/testing/")
  end

end
