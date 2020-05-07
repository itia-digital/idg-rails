# Itia Digital Gem

This gem is about easy working for Itia Digital and any code partner for API

## How does idg works?

This gems makes easy [the workflow](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial) through serviced to handle business logic.
Staring with CRUD operations.

## Getting Started

#### Installation

Add idg to your Gemfile and bundle install:
```console
gem "idg"
```    
Or install it yourself as:
```bash
$ gem install idg
```

idg init is easy:
```console
rails g idg:install
```

This creates default scaffold templates for IDG. After command you may visit ```lib/templates/rails/```
Then create tour own scaffolds or controllers and you're done!

#### Implementation

After install just need to run default ```rails g scaffold..``` to implement Fetch, Filter, Find, Insert, Update and Delete services for the model you would link to implement. 

Note:
If you include [Versionist gem](https://github.com/bploetz/versionist) in your project it will include a ```:by``` filter for your records


#### CLI
With ```idg``` you can run rails generators with yml files o direct.

1. With ```--yml``` option, a sample for yml file content is 
```yaml
# user.yml file

user:
    generator: user_profile
        user:references:required
        about_me:text:required
```

So the command would be
```console
> idg g scaffold --yml=user.yml
```

## Contributing
Special thanks to:
 - For install generator: [this post](https://stackoverflow.com/a/45245960/4641125)
 - For gem cli: [jendiamond's gists](https://gist.github.com/jendiamond/6128723)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
