# Ds101

A Simple Implementation of Data Structure in Ruby.

Currently Available Data Structures:

- Linked List
- Double Linked List

## Installation
Install the gem and add to the application's Gemfile by executing:

    $ bundle add ds_101

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ds_101

## Usage

 after installing the gem, you can use available class and their methods.
 Classes:
 - `Ds101::LinkedList::SingleLinkedList`
 - `Ds101::LinkedList::DoubleLinkedList`
 
 Both classes has the following methods:
 - `append`
 - `remove`
 - `remove_head`
 - `clear`
 - `to_a`
 - `find`
 - `find_by`
 - `each`
 - `concat`
 - `init_from_arr`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, 
and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ShroukAbozeid/ds_101.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
