class HomePagesController < ApplicationController
  layout 'frontpage'
  # GET /home_pages
  # GET /home_pages.json
  def index
    if user_signed_in?
      if current_user.profilable.questionaire.nil?
        # create new questionaire for the user according to the user_profile
        questionaire = Questionaire.new

        # assign the questionable polymorophic relation
        questionaire.questionable = current_user.profilable
        # save the user after the associated user_profile and the initial questionaire is created
        questionaire_saved = questionaire.save

      end
      redirect_to user_dashboards_path
    else
      @contact_form_props = {
          companyName: "Uni-Inovation Group",
          location: "Vancouver, BC",
          phoneNumber: "123.345.5678",
          email: "example@abc.com",
          companyText: "Comany Name",
          locationText: "Address",
          phonetext: "Contact Number",
          emailText: "Email-Id"
        }
    end
  end

  # GET /home_pages/1
  # GET /home_pages/1.json
  def show
  end

  # GET /home_pages/new
  def new

  end

  # GET /home_pages/1/edit
  def edit
  end

  # POST /home_pages
  # POST /home_pages.json
  def create

  end

  # PATCH/PUT /home_pages/1
  # PATCH/PUT /home_pages/1.json
  def update

  end

  # DELETE /home_pages/1
  # DELETE /home_pages/1.json
  def destroy

  end

  def faq
    @faq = [
    	{
    		"id": 1,
    		"question": "adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu",
    		"answer": "netus et malesuada fames ac turpis egestas. Fusce aliquet magna"
    	},
    	{
    		"id": 2,
    		"question": "Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,",
    		"answer": "mi, ac mattis velit justo nec ante. Maecenas mi felis,"
    	},
    	{
    		"id": 3,
    		"question": "dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,",
    		"answer": "nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,"
    	},
    	{
    		"id": 4,
    		"question": "scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed",
    		"answer": "mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla"
    	},
    	{
    		"id": 5,
    		"question": "lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet",
    		"answer": "aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis"
    	},
    	{
    		"id": 6,
    		"question": "libero lacus, varius et, euismod et, commodo at, libero. Morbi",
    		"answer": "ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla"
    	},
    	{
    		"id": 7,
    		"question": "ante dictum mi, ac mattis velit justo nec ante. Maecenas",
    		"answer": "nunc. Quisque ornare tortor at risus. Nunc ac sem ut"
    	},
    	{
    		"id": 8,
    		"question": "egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus",
    		"answer": "Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,"
    	},
    	{
    		"id": 9,
    		"question": "porta elit, a feugiat tellus lorem eu metus. In lorem.",
    		"answer": "condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing"
    	},
    	{
    		"id": 10,
    		"question": "placerat, augue. Sed molestie. Sed id risus quis diam luctus",
    		"answer": "Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin"
    	},
    	{
    		"id": 11,
    		"question": "Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna,",
    		"answer": "interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus"
    	},
    	{
    		"id": 12,
    		"question": "sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis",
    		"answer": "et netus et malesuada fames ac turpis egestas. Aliquam fringilla"
    	},
    	{
    		"id": 13,
    		"question": "posuere, enim nisl elementum purus, accumsan interdum libero dui nec",
    		"answer": "Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper"
    	},
    	{
    		"id": 14,
    		"question": "nisi. Cum sociis natoque penatibus et magnis dis parturient montes,",
    		"answer": "orci, in consequat enim diam vel arcu. Curabitur ut odio"
    	},
    	{
    		"id": 15,
    		"question": "dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a",
    		"answer": "justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse"
    	},
    	{
    		"id": 16,
    		"question": "Duis elementum, dui quis accumsan convallis, ante lectus convallis est,",
    		"answer": "sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed"
    	},
    	{
    		"id": 17,
    		"question": "purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,",
    		"answer": "arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus."
    	},
    	{
    		"id": 18,
    		"question": "Donec at arcu. Vestibulum ante ipsum primis in faucibus orci",
    		"answer": "ante ipsum primis in faucibus orci luctus et ultrices posuere"
    	},
    	{
    		"id": 19,
    		"question": "dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a",
    		"answer": "Aenean gravida nunc sed pede. Cum sociis natoque penatibus et"
    	},
    	{
    		"id": 20,
    		"question": "tortor at risus. Nunc ac sem ut dolor dapibus gravida.",
    		"answer": "tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel,"
    	},
    	{
    		"id": 21,
    		"question": "ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet",
    		"answer": "egestas, urna justo faucibus lectus, a sollicitudin orci sem eget"
    	},
    	{
    		"id": 22,
    		"question": "Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla.",
    		"answer": "porttitor tellus non magna. Nam ligula elit, pretium et, rutrum"
    	},
    	{
    		"id": 23,
    		"question": "pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac",
    		"answer": "Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue"
    	},
    	{
    		"id": 24,
    		"question": "eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra",
    		"answer": "vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue"
    	},
    	{
    		"id": 25,
    		"question": "urna, nec luctus felis purus ac tellus. Suspendisse sed dolor.",
    		"answer": "tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,"
    	}
    ]

  end

  private
    # Use callbacks to share common setup or constraints between actions.

end
