xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 6) do
    xml.Say "Welcome to #{@client.first_name}. Please enter your password"
  end
end
