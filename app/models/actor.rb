class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = []
    self.characters.each do |char|
      roles << char.name + ' - ' + self.shows.find_by(id: char.show_id).name
    end
    roles
  end
end



# Associate the Actor model with the Character and Show model. An actor should have many characters and many shows through characters.
# Write a method in the Actor class, #full_name, that returns the first and last name of an actor.
# Write a method in the Actor class, #list_roles, that lists all of the characters that actor has.
# Write a migration that adds the column catchphrase to your character model.

#
# Write a migration for the shows table. A show should have a name and a genre.
# Create the neccesary associations between shows, networks, and characters.
