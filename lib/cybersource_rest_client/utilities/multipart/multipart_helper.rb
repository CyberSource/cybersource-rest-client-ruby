module CyberSource
  class MultipartHelper
    def build_data_files(boundary, form_params)
      data = ''
      eol = "\r\n"

      delimiter = '-------------' + boundary

      form_params.each do |name, content|
        data << "--" << delimiter << eol
        data << 'Content-Disposition: form-data; name="' << name << '"; filename="' << name << '"' << eol
        data << 'Content-Transfer-Encoding: binary' << eol
        data << eol
        data << content << eol
      end

      data << "--" << delimiter << "--" << eol

      data
    end
  end
end