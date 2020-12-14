class ApplicationService
    
    # creates a new instance of the class with the arguments or block you pass to it, 
    # and calls get_credentials on the instance
    def self.get_credentials(*args, &block)
        new(*args, &block).get_credentials
    end

    def self.redirect(*args, &block)
        new(*args, &block).redirect
    end

    def self.get_token(*args, &block)
        new(*args, &block).get_token
    end
end