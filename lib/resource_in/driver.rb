require 'json'

module ResourceIn
  class Driver
    FORMAT = ['name', 'address', 'status', 'location', 'boottime']

    def get_data(command, cachepath)
      if !!cachepath and FileTest.exists?(cachepath)
        JSON.parse(File.read(cachepath))
      else
        system("#{command} 1> #{cachepath} 2> /dev/null")
        get_data
      end
    end
    def create
      # This methods implemented on each driver
    end
  end
end
