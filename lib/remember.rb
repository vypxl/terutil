require 'fileutils'
require 'json'

module TerUtil::Remember
    FPATH = File.expand_path("terutil", ENV['XDG_CONFIG_HOME'] || "~/.config")
    FNAME = FPATH + '/remember.json'

    def self.reset_file
        File.open(FNAME, 'w') { |f| f.write "{}" }
    end

    def self.load_file
        if !File.exists? FNAME
            FileUtils.mkdir_p FPATH
            reset_file
        end
        
        File.read(FNAME)
    end

    def self.load_data
        ret = JSON.parse load_file
        raise JSON::ParserError if ret.class != Hash
        ret

    rescue JSON::ParserError
        puts "The remember data file (#{FNAME}) is corrupted."
        puts "Please fix it manually or reset it."
        print "Reset (ALL DATA WILL BE LOST!)? (y/n): "
        if ['y', 'yes'].include? gets.chomp
            reset_file
            puts "File reset."
        end
    end



    def self.write_data(data)
        File.open(FNAME, 'w') { |f| f.write JSON.generate(data) }
    end

    def self.read(key)
        load_data[key]
    end

    def self.write(key, val, silent=true)
        if val == '' 
            delete key
            puts "Deleted #{key}." if !silent
        else 
            write_data load_data.tap { |d| d[key] = val }
            puts "Set #{key} to #{val}." if !silent
        end
    end

    def self.delete(key)
        write_data load_data.reject { |k| k == key }
    end
end
