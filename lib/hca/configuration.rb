module Hca
  OPTIONS = [:escape_html, :clean_value, :custom_html_escape, :custom_clean_value, :templates_path]

  class << self

    def configure
      yield(config) if block_given?
    end

    def config
      @config ||= get_config
    end

    private

    def get_config
      Struct.new(*OPTIONS).new.tap do |config|
        config.escape_html = true
        config.clean_value = true
        config.templates_path = 'app/assets/javascripts'
      end
    end
  end
end
