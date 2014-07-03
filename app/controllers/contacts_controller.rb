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
 		image1=params[:contact][:photo].original_filename
 		@contact.photo = image1
   		if @contact.update(contact_params)
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

	def male
		@contact = Contact.where(:image => 'Male')
		render "index"

	end

	def female
		@contact = Contact.where(:image => 'FeMale')
		render "index"
  end


  def ajax
    @contact = Contact.where("firstname like ?", "#{params[:firstname]}%")
   # puts @contact
    # puts @contact.to_s
   # puts "------------"
    puts @contact.as_json
   render json:@contact.as_json
    #render json:@contact.to_json

  end


	def create
	  	@contact = Contact.create(contact_params)
		image1=params[:contact][:photo].original_filename
		@contact.photo = image1
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
			image1=params[:contact][:photo].original_filename
	    	directory = "public/data"
 	 		path = File.join(directory, image1) 
			File.open(path, "wb") { |f| f.write(params[:contact][:photo].read) }
			params.require(:contact).permit(:firstname, :lastname, :mno, :emailid, :add, :image)
		end
end
