module Hca
  class Template < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
      @data = @data.gsub("'", "\\'").gsub("\n", "\\n")
    end

    def evaluate(scope, locals, &block)
      cs_template = self.class.runtime.eval("compile('#{data}', #{config})")
      js_template = CoffeeScript.compile(cs_template, no_wrap: true)
      @output ||= wrap_template(js_template)
    end

    private

    def wrap_template(template)
      <<-JST
(function() {
    window.JST || (window.JST = {});
    window.JST['#{template_name}'] = function(context) {
        return function() { #{template} }.call(context);
    };
})();
      JST
    end

    def config
      Hca.config.as_json.transform_keys { |key| key.camelize(:lower) }.to_json
    end

    def template_name
      path = Pathname.new(file).relative_path_from(Rails.root.join(Hca.config.templates_path))
      path.to_s.chomp(path.extname)
    rescue
      file
    end

    class << self
      def runtime
        @runtime ||= load_runtime
      end

      def load_runtime
        path = File.join(File.dirname(__FILE__), '..', '..', 'vendor', 'assets', 'javascripts', '**', '*.js')
        runtime = Dir[path].map { |file| File.read(file) }
        ExecJS.compile(runtime.join(' '))
      end
    end
  end
end
