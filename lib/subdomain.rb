# class Subdomain
  # def self.matches?(request)
    # case request.subdomain
    # when 'www', '', nil
      # false
    # else
      # true
    # end
  # end
# end
class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
end