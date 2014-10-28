xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 6) do
    xml.Say "Your have entred wrong password bye"
  end
end