require_relative 'app' # Assuming that 'app.rb' contains the LibraryApp class
def main_app
  library_app = LibraryApp.new
  library_app.run
end

main_app
