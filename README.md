# HCA (HAML-CoffeeScript Assets)

HCA compiles HAML templates with inline CoffeeScript code into client-side JavaScript template functions that are available in `window.JST` object.

## Installation

Ruby on Rails 3.1+ is required.

Add this line to your application's Gemfile:

```ruby
gem 'hca'
```

And then execute:

```
$ bundle
```

## Configuration

You can configure HCA by adding an initializer into your `config/initializers` directory. Configuration options are:
- `templates_path` - base templates path used for generating correct template keys in `window.JST` object. Default value is `app/assets/javascripts`
- `escape_html` - escape special HTML characters. Enabled by default
- `custom_html_escape` - the name of the custom HTML escape function
- `clean_value` - render empty strings instead of NULL or undefined CoffeeScript values. Enabled by default
- `custom_clean_value` - the name of the custom function to clean CoffeeScript values

### Example

```ruby
Hca.configure do |config|
  config.custom_html_escape = '_.escape' # using Underscore.js 'escape' function
  config.custom_clean_value = '$.trim' # using jQuery.trim to clean NULL or undefined CoffeeScript values
  config.templates_path = 'app/assets/javascripts/templates'
end
```

## Usage

* Put HAML templates to your `app/assets/javascripts/...` directory. Give them `.hca` extention.
* Add an initializer with correct path to your `.hca` templates
* Add templates to the Assets Pipeline

### Example

HCA template

TODO: add an example here

## Hints

* Using custom cleanup and escape functions helps reducing the size of the generated JavaScript code.

## License

MIT

HCA internally uses [haml-coffee](https://github.com/netzpirat/haml-coffee) library.

## Contributing

1. Fork it (https://github.com/arg/hca/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
