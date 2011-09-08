module Testing
  module ServerResponseTimesHelper

    def asset_link(path)
      "/testing/server_response_time/assets/#{path}"
    end

    # menu highlighting
    def highlight(name)
      (@highlight == name) ? ' highlighted' : nil
    end

    def f_prec(text)
      if text.is_a? Float
        "%.2f" % text
      else
        text
      end
    end
  end
end
