class AddWhatsappToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :whatsapp, :string
  end
end
