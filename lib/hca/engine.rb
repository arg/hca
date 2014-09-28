module Hca
  class Engine < Rails::Engine
    isolate_namespace Hca

    initializer 'hca.environment', after: 'sprockets.environment', group: :all do |app|
      next unless app.assets
      require 'hca/template'
      app.assets.register_engine '.hca', Hca::Template
    end
  end
end
