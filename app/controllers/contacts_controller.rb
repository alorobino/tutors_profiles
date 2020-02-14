class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to "/"
    flash[:notice] = "Thanks for your message!"
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :whatsapp, :message)
    end
end
