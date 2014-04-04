class Rolodex
  def initialize
    @contacts = []
    @id = 1000
  end

  def contacts
    @contacts
  end

    def add_new_contact(contact)
      contact.id = @id
      @contacts << contact
      @id += 1
    end

    def get_contacts
      return @contacts
    end

    def remove_contact(id)
      @contacts.delete_if{|c| c.id==id}
    end

    def edit_contact(id, new_first_name, new_last_name, new_email, new_note)
      puts "in edit contact"
      @contacts.each do |contact|
        puts "checking out contact" + contact.inspect
        if contact.id==id.to_i
          contact.first_name = new_first_name
          contact.last_name = new_last_name
          contact.email = new_email
          contact.note = new_note
        end
      end
    end

    def find(trait, search_goal)
      found_contacts = []

      @contacts.each do |contact|
        if contact.send(trait) == search_goal
          found_contacts << contact
        end
      end

      return found_contacts
    end

end