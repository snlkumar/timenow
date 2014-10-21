xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    xml.Say "Press 1 for check in and press 2 for checkout"
  end
end