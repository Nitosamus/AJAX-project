class EmailsController < ApplicationController
	def index
		@emails = Email.all
	end

	def create
		@email = Email.new(object:Faker::Hipster.sentence(word_count: 2),
		body:Faker::Hipster.paragraph(sentence_count: 2,
			supplemental: true, random_sentences_to_add: 4), read: false)
			@email.save
		respond_to do |format|
			format.html{
			redirect_to emails_path, notice: "created successfull"	
			}
			format.js{

			}
		end
		
	end

	def show
		@email = find_email
		respond_to do |format|
			format.html{}
			format.js{}
		end


	end
	def destroy
		@email= find_email
		@email.destroy
		respond_to do |format|
			format.html{
			redirect_to emails_path, success: "Deleted successfull"
			}
			format.js{}
		end
		
	end

	def update
		@email = find_email
		if @email.read === false
			@email.update(read: true)
		else
			@email.update(read: false)
		end

		respond_to do |format|
				format.html{}
				format.js{}
		end
	end
	private
	def find_email
		Email.find(params[:id])
	end
end
