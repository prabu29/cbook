class ContactsController < ApplicationController

	def new

		@contact = Contact.new
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def index
		@contact = Contact.all
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact=Contact.find(params[:id])
 		image=params[:contact][:photo].original_filename
 		@contact.photo = image
   		if @contact.update(getparam)
			respond_to do |format|
				format.html { redirect_to @contact , notice: 'Contact updation Success' }
			end
		else
			render 'edit'
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
	end


	def create
	  	@contact = Contact.create(contact_params)
		image=params[:contact][:photo].original_filename
		@contact.photo = image
		if @contact.save   
		    respond_to do |format|
		    	format.html { redirect_to @contact , notice: 'Done, Contact Added' }
		    end
		else
		    render 'new'
		end
	end
	private
		def contact_params
			image=params[:contact][:photo].original_filename
	    	directory = "public/data"
 	 		path = File.join(directory, image) 
			File.open(path, "wb") { |f| f.write(params[:contact][:photo].read) }
			params.require(:contact).permit(:firstname, :lastname, :mno, :emailid, :add)
		end
end
