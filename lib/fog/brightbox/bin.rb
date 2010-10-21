class Brightbox < Fog::Bin
  class << self

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
        when :compute
          Fog::Brightbox::Compute.new
        end
      end
      @@connections[service]
    end

    def services
      [:compute]
    end

    def account
      # FIXME: Needs a cleaner interface at the API end
      account_id ||= JSON.parse(@@connections[:compute].list_accounts.body).first["id"]
      account = Fog::Brightbox::Compute::Account.new(JSON.parse(@@connections[:compute].get_account(account_id).body))
      account.connection = @@connections[:compute]
      return account
    end

  end
end
