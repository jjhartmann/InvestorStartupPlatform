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
          phoneNumber: "6043632767",
          email: "info@inp.global",
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

	def mailcontactform

	end



  def faq
    @faq = [
    	{
    		"id": 1,
    		"question": "What happens if I publish my profile?",
    		"answer": "If you publish your INP profile, we'll list it in our directory of other published INP Company Profiles. A limited view will be accessible to anyone browsing our directory of companies. Only investors with membership to a group that uses INP's Group Investor Platform will be able to send you a request for full access."
    	},
    	{
    		"id": 2,
    		"question": "What can people see if I publish?",
    		"answer": "INP only presents a limited view of your company to people browsing our directory. Your contact information, executive summary, documents, financials, and pitch deck are all kept private. Only investors from groups with a license for INPs Group Investor Product will be able to send you a request for full access."
    	},
    	{
    		"id": 4,
    		"question": "How to Access the Search Engine?",
    		"answer": "1. Log into your INP account
2. Click the Search Icon in the top navigation bar
3. On the left of the next page, you will see a navigation column where you can enter search filters; Location, Industry and Key Word. You can apply multiple filters at once. You can also segment results to just investors by clicking the investor link on the left."
    	},
    	{
    		"id": 5,
    		"question": "How to get in touch with INP Support?",
    		"answer": "If you have a question or need help, just send us your concerns to support@inp.global, we'll get back to you as soon as possible and the response will be sent to you in an email as well. Or you can arrange an online meeting using our meeting room function"
    	},
    	{
    		"id": 6,
    		"question": "My company profile is out of date, where can I delete it. ",
    		"answer": "If you're the owner of the company profile, you can login and delete it in your Account Settings under Manage Companies."
    	},
    	{
    		"id": 7,
    		"question": "My profile is deleted, but it's still showing up in a Google search with a dead link. How do I get Google to stop showing that result?",
    		"answer": "That's something Google has to take care of on their end. Google has a rolling cache refresh that continuously updates their search results for different search terms. Usually when a link has been taken down it's only a few days before it's been re-cached and updated by Google. Once that happens the result will be gone."
    	},
    	{
    		"id": 8,
    		"question": "What's the difference between an Announcement and a Discussion?",
    		"answer": "Discussions are reply-all communications. Replies go through INP, where they are captured and sent to everyone in the thread. 
Announcement replies are sent only to the sender. When users reply via email the reply bipasses INP and is sent directly to the sender's email. The reply-to address will be the sender's email. "
    	},
    	{
    		"id": 9,
    		"question": "How do I target specific group members only with a communication?",
    		"answer": "In Deal Discussions you can select a specific audience within the deal participants, or you can select All Participants to send it to everyone who has access to the deal. 
In Group Discussions and Announcements, you can choose to send them to either All Active Members, or you can send them to a specific subgroup. "
    	},
    	{
    		"id": 10,
    		"question": "Who sees a Deal Discussion? What’s deal discussion?",
    		"answer": "Whether or not you get sent, or can access a Discussion is based on two factors, being a Participant and being subscribed. Members who have access to a deal are considered Deal Participants.
Deal Subscription automatically happens when a participant expresses an interest level a deal. All members who are set to Observing will be subscribed. (Members can also manually unsubscribe themselves, if they wish to express an interest level without being subscribed. They can also change their default settings to be automatically subscribed to all deals immediately when they gain access, without having to set an interest level. Different configurations work better for different groups.)"
    	},
    	{
    		"id": 11,
    		"question": "How could I add people to my network?",
    		"answer": "When you follow someone, they will get a notification, if they follow you back, then they will show in your connection tab."
    	},
    	{
    		"id": 12,
    		"question": "How could I send message to my connections? ",
    		"answer": "Startups can only message people in their network. Investors can message anyone"
    	},
    	{
    		"id": 13,
    		"question": "How could I add meetings or send meeting requests to people? ",
    		"answer": "Only investors can create and initialize meetings. The meetings are created through the company profiles, and anyone who is a member of the company will have access to the meetings."
    	},
    	{
    		"id": 14,
    		"question": "How could I initiate a meeting room?",
    		"answer": "The meeting rooms are initialized by the Investors, they choose a time and date that can be changed in the administration panel. When the meeting date/time is met, the meeting starts."
    	}
    ]

  end

  private
    # Use callbacks to share common setup or constraints between actions.

end
