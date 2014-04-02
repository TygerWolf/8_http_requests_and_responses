class Contact

attr_accessor :id

attr_accessor :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

def to_s
    "ID: #{@id}\n First Name: #{@first_name}\n Last Name: #{@last_name}\n Email: #{@email}\n Notes:#{@note}"
end


end
# def add_new_contact
#   print "Enter First Name: "
#   first_name = gets.chomp
#   print "Enter Last Name: "
#   last_name = gets.chomp
#   print "Enter Email Address: "
#   email = gets.chomp
#   print "Enter a Note: "
#   note = gets.chomp
#   contact = Contact.new(first_name, last_name, email, note)
# end




# Contact.new("Adrian", "Carton de Wiart", "adianwiart@gmail.com", "Even cooler.")

