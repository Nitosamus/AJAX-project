class EmailsController < ApplicationController
	def index
		@emails = Email.all
	end

	def create
		@email = Email.new(object:Faker::Hipster.sentence(word_count: 2),
		body:Faker::Hipster.paragraph(sentence_count: 2,
			supplemental: true, random_sentences_to_add: 4))
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
		@email = Email.find(params[:id])
		respond_to do |format|
			format.html{}
			format.js{}
		end


	end

	private
	def destroy

	end
end
