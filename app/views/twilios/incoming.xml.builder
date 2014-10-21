xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => "") do
    xml.Say "Welcome to #{@employee.first_name}'s residence. Please enter your password."
  end
end
