# TerUtil - Terminal Util

> A collection of useful terminal utilities.

Featuring:
 - Remember
 - C
 - Swap
 - Newfile

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

## Swap

Swap is a little helper which swaps two files.
Calling `swap file1 file2` is equal to `mv file1 <some tempfile> && mv file2 file1 && <tempfile> file2`.

```
Usage:
  swap <file1> <file2>
```

## Newfile

Newfile is touch with superpowers. Powered by remember, you can create files with premade file headers.
An example:
> You want to create a new ruby executable script file. 
> You would need to `touch script.rb` and enter `#! /usr/bin/ruby` as the first step.
> With newfile, you can define a file header for ruby files:
> `remember newf/ruby $(echo -e "#! /usr/bin/ruby\n\n")`
> and now you can just `newf ruby script.rb` and boom! You have your premade file!

```
Usage:
  newf <configuration name> <file name>

To add a configuration:
  remember newf/<configuration name> <file header>

Example:
  remember newf/ruby "#! /usr/bin/ruby\n\n"
```

## License:
MIT License (see LICENSE file)

