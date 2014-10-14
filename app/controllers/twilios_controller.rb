class TwiliosController < ApplicationController
  include TwiliosHelper
  after_filter :set_header

  skip_before_filter :verify_authenticity_token
  def voice
  response = Twilio::TwiML::Response.new do |r|
  r.Say 'Hey there. Congrats from timenow app', :voice => 'alice'
  r.Play 'http://linode.rabasa.com/cantina.mp3'
  end
  
  render_twiml response
  end
  

  BASE_URL = "http://lvh.me:3000/twilios"

  #
  def incoming
    # Get client by phone number
    client_phone = params[:From]
    @employee = Employee.find_by_phone(client_phone)
    # Welcom message.
    # "Welcome to #{@employee.first_name}'s residence."
    # Ask agent to identy him/herself.
    # "Please enter your employee code"
    if @employee.nil?
      render :action => "no_client.xml.builder"
    else
      @post_to = BASE_URL + "/verify?emp_id=#{@employee.id}"
      render :action => "incoming.xml.builder", :layout => false
    end
  end

  #
  def verify
    @client = Employee.find(params[:emp_id])
    # @agent = Agent.find_by_code(params['Digits'])
    if @client.nil?
      @post_to = BASE_URL + "/verify?client_id=#{@client.id}"
      render :action => "no_client.xml.builder"
    return
    else
      if @client.checked_in?(@client.id)
        @message = "You have already checked in."
      else
        @client.check_in(@client.id)
        @message = "Now you are checked in."
      end
    end
    @post_to = BASE_URL + "/direction?agent_id=#{@agent.id}&client_id=#{@client.id}"
    render :action => "direction.xml.builder", :layout => false
  end
#
# def direction
# @client = Client.find(params[:client_id])
# @agent = Agent.find(params[:agent_id])
# @message = @client.task_list
# @post_to = BASE_URL + "/direction?agent_id=#{@agent.id}&client_id=#{@client.id}"
# # 1 to hear the tasks again, 2 to check out, 3 to hang up.
# if params['Digits'] == '1'
# render :action => "direction.xml.builder", :layout => false
# elsif params['Digits'] == '2'
# @agent.check_out(@client.id)
# @goodbye_message = "Thank you for your service today."
# render :action => 'goodbye.xml.builder', :layout => false
# elsif params['Digits'] == '3'
# @message = "Yang is the most awesome guy ever - both personally and professionally. He is pretty sexy, too."
# render :action => 'direction.xml.builder', :layout => false
# elsif params['Digits'] == '4'
# @goodbye_message = "Have a great day."
# render :action => 'goodbye.xml.builder', :layout => false
# end
# end

end
