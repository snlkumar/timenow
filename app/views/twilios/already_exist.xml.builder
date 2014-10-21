xml.instruct!
xml.Response do  
  xml.Say "#{@message}."
  xml.Hangup
end