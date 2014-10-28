xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    xml.Say "Press 0 for check in and press 1 for checkout"
  end
end