# TerUtil - Terminal Util

> A collection of useful terminal utilities.

Featuring:
 - Remember
 - C

## Installation
You need ruby >2.6 installed.
`gem install terutil`

## Remember

Remember can be used to store simple key-value pairs which can be accessed via the commandline or the api.
The data is stored in the JSON file `$XDG_CONFIG_HOME/terutil/remember.json`.

### CLI
```
Usage:
    Retrieve value: remember <key>
    Store value:    remember <key> <value>
    Delete value:   remember <key> ''
```

### API

The ruby api exposes the following simple methods:
```ruby
require 'terutil'
include TerUtil

# To read a value
Remember.read "key"

# To set a value
Remember.write "key", "value"

# To delete a value
Remember.delete "key"
# or
Remember.write "key", ""
```

## C

C is a directory quick switcher. Powered by remember, you can save directories and jump to them easily.

```
Usage:
    Jump to shortcut directory: c
    Jump to stored directory:   c <name>

To set the shortcut directory, use  `c -`
To store a directory, use `remember "c/<name>" <directory>`
```

To use it, you have to add a function to your shell so it can cd for you.

#### Sh, Bash, Zsh ..
Add this to your `~/.bashrc` (or whatever rc file):
```bash
function c() {
    if r=$(_c $@); then
        cd $r
    else
        echo $r
    fi
}
```

#### Fish
Add this to your `config.fish`
```fish
function c
    set r (_c $argv)
    if test $status -eq 0
        cd $r
    else
        echo $r
    end
end
```

## License:
MIT License (see LICENSE file)
