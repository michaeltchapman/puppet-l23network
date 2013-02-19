Puppet::Type.newtype(:l3_if_downup) do
    @doc = "Down, flush and Up interface"
    desc @doc

    newparam(:interface) do
      isnamevar
      desc "The interface, that will be down, flush and up"
      #
      validate do |val|
        if not val =~ /^[0-9A-Za-z\.\-\_]+$/
          fail("Invalid interface name: '#{val}'")
        end
      end
    end

    newparam(:flush) do
      newvalues(true, false)
      defaultto(true)
      desc "Interface will be flushed"
    end

    newparam(:refreshonly) do
      newvalues(true, false)
      defaultto(true)
    end

    def refresh
      provider.restart
    end

    # autorequire(:l2_ovs_bridge) do
    #   [self[:bridge]]
    # end
end
