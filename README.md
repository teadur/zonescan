# Zonescan

zonescan - Zone Scan
simple cli utility to scan provided list of domains for running services

## TODO:
*take file(txt/csv/zonefile) as input.

*try to access resolved domain via http(s) and record the response_code

*figure out if domain is dnssec signed

*find / add other services to check for

*output domain lists from results

*output statistics of the results

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zonescan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zonescan

## Usage

#### Show help
zonescan
#### Scan domains from input file
zonescan -f input.txt
#### Show recoded results of domain
zonescan -s domain.tld


## Contributing

1. Fork it ( https://github.com/teadur/zonescan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
